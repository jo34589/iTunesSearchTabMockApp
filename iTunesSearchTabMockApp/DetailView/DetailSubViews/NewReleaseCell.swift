//
//  NewReleaseCell.swift
//  iTunesSearchTabMockApp
//
//  Created by 조선우 (SunWoo Cho) on 2022/06/10.
//

import SwiftUI

struct NewReleaseCell: View {
    
    let appInfo: iTunesResult
    var releaseDateString: String {
        if let releaseDate = appInfo.releaseDate {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            let _releaseDate = formatter.date(from: releaseDate)
            let day = Calendar.current.dateComponents([.day], from: _releaseDate!, to: Date()).day!
            
            if day > 365 {
                return "\(day/365) 년 전"
            } else if day > 30 {
                return "\(day/30) 개월 전"
            } else {
                return "\(day) 일 전"
            }
        } else {
            return ""
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text("새로운 기능")
                .font(.system(size: 24, weight: .bold))
            HStack(spacing: 0) {
                if let version = appInfo.version {
                    Text("버전 \(version)")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.gray)
                }
                Spacer()
                Text(releaseDateString)
                    .font(.system(size: 10, weight: .regular))
                    .foregroundColor(.gray)
            }
            if let releasNote = appInfo.releaseNotes {
                Text(releasNote)
            }
        }
        
    }
}
