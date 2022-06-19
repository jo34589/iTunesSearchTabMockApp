//
//  SearchListCell.swift
//  iTunesSearchTabMockApp
//
//  Created by 조선우 (SunWoo Cho) on 2022/06/08.
//

import SwiftUI
import Kingfisher

struct SearchListCell: View {
    
    var appInfo: iTunesResult
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 8) {
                    let url = appInfo.artworkUrl60 ?? appInfo.artworkUrl100 ?? appInfo.artworkUrl512 ?? ""
                    KFImageView(url: url)
                        .frame(width: 60, height: 60)
                        .scaledToFill()
                        .cornerRadius(15)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        
                        let appName = appInfo.trackName ?? appInfo.trackCensoredName ?? ""
                        let artistName = appInfo.artistName ?? ""
                        let averageUserRating = appInfo.averageUserRating ?? 0.0
                        let userRatingCount = appInfo.userRatingCount ?? 0
                        
                        Text(appName)
                            .font(.system(size: 16, weight: .semibold))
                            .lineLimit(2)
                            .truncationMode(.tail)
                            .foregroundColor(Color.black)
                        Text(artistName)
                            .font(.system(size: 14, weight: .light))
                            .foregroundColor(.gray)
                            .lineLimit(1)
                            .truncationMode(.tail)
                        HStack(alignment: .center, spacing: 4) {
                            StarRateView(rate: averageUserRating)
                            RateCountView(count: userRatingCount)
                            Spacer()
                        }
                    }.frame(width: geometry.size.width-160)
                        
                    
                    Button(action: {
                        //TODO?: Download button action is empty
                        /*
                         
                         */
                    }, label: {
                        let textForButton = (appInfo.price ?? 0) > 0.0 ? appInfo.formattedPrice ?? "받기" : "받기"
                        Text(textForButton)
                            .font(.system(size: 14, weight: .semibold))
                            .frame(width: 60, height: 26)
                            .foregroundColor(.blue)
                            .background(Color.init(.sRGB, red: 0.8, green: 0.8, blue: 0.8, opacity: 1))
                            .cornerRadius(13)
                    })
                }//상단 HStack 종단점
                .frame(width: geometry.size.width - 32, height: 80)
                //.padding(.leading, 8)
                .padding(.trailing, 16)
                .padding(.bottom, 10)
                
                
                if let urls = appInfo.screenshotUrls, !urls.isEmpty {
                    ScreenshotView(urls: urls)
                        .frame(height: UIScreen.main.bounds.height*0.3)
                        .padding(.trailing, 16)
                }
            }//셀 가장 바탕의 VStack
            .frame(width: geometry.size.width, height: geometry.size.height)
            .padding()
        }//geometry reader ends.
    }
}

struct SearchListCell_Previews: PreviewProvider {
    static var previews: some View {
        SearchListCell(appInfo: sampleResult.results.first!)
    }
}
