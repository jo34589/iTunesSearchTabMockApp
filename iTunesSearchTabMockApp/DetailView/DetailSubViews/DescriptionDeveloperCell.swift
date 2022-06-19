//
//  DescriptionDeveloperCell.swift
//  iTunesSearchTabMockApp
//
//  Created by 조선우 (SunWoo Cho) on 2022/06/09.
//

import SwiftUI

struct DescriptionDeveloperCell: View {
    
    let appInfo: iTunesResult
    
    @State private var lookMore: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomLeading) {
                if let description = appInfo.description {
                    Text(description)
                        .lineSpacing(10)
                        .lineLimit(lookMore ? nil : 3)
                }
                HStack{
                    Spacer()
                    Button(action: {
                        lookMore.toggle()
                    }, label: {
                        Text(lookMore ? "덜 보기" : "더 보기")
                            .foregroundColor(.blue)
                            .background(Color.white)
                            .shadow(color: .white, radius: 20, x: 0, y: 0)
                    })
                }
            }
            .padding(.bottom)
            
            Text(appInfo.artistName ?? "")
                .foregroundColor(.blue)
        }
    }
}



