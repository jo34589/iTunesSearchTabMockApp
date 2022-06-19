//
//  DetailViewHeader.swift
//  iTunesSearchTabMockApp
//
//  Created by 조선우 (SunWoo Cho) on 2022/06/09.
//

import SwiftUI

struct DetailViewHeader: View {
    
    var appInfo: iTunesResult
    
    var body: some View {
        HStack(spacing: 16) {
            let appIconUrl = appInfo.artworkUrl100 ?? appInfo.artworkUrl512 ?? appInfo.artworkUrl60 ?? ""
            KFImageView(url: appIconUrl)
                .frame(width: 100, height: 100)
                .cornerRadius(20)
                .scaledToFit()
            VStack(alignment: .leading) {
                Text(appInfo.trackName!)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
                    .lineLimit(2)
                Text(appInfo.artistName!)
                    .font(.system(size: 12, weight: .light))
                    .foregroundColor(.gray)
                Spacer()
                HStack {
                    //파란 받기 버튼
                    let downloadButtonText = (appInfo.price ?? 0) > 0.0 ? appInfo.formattedPrice ?? "받기" : "받기"
                    Text(downloadButtonText)
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 70, height: 26)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(13)
                    Spacer()
                    //공유 버튼
                    Button(action: {
                        //아직 액션 없음.
                    }, label: {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.blue)
                            .background(Color.clear)
                    })
                }//HStack ends
            }//VStack ends
        } //Hstack ends
    }
}
