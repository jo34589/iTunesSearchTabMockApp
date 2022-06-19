//
//  AppInfoHorizontalScroll.swift
//  iTunesSearchTabMockApp
//
//  Created by 조선우 (SunWoo Cho) on 2022/06/09.
//

import SwiftUI

struct InfoScreenshotCell: View {
    
    let appInfo: iTunesResult
    var urls: [String] {
        return appInfo.screenshotUrls ?? []
    }
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 0) {
                    //평가개수, 평점, 별점
                    VStack(spacing: 8) {
                        RateCountDetailView(count: appInfo.userRatingCount ?? 0)
                        RateView(rate: appInfo.averageUserRating ?? 0, fontSize: 24)
                        StarRateView(rate: appInfo.averageUserRating ?? 0)
                    }
                    .frame(width: 120)
                    Divider()
                    //연령, 연령표시, 세
                    VStack(spacing: 8) {
                        Text("연령")
                            .foregroundColor(.gray)
                            .font(.system(size: 10, weight: .light))
                        Text(appInfo.contentAdvisoryRating!)
                            .foregroundColor(.gray)
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                        Text("세")
                            .foregroundColor(.gray)
                            .font(.system(size: 10, weight: .light))
                    }
                    .frame(width: 120)
                    Divider()
                    //개발자, 아이콘, 개발자이름
                    VStack(spacing: 4) {
                        Text("개발자")
                            .foregroundColor(.gray)
                            .font(.system(size: 10, weight: .light))
                        Image(systemName: "person.crop.square")
                            .foregroundColor(.gray)
                            .frame(width: 40, height: 40)
                            .scaledToFit()
                        Text(appInfo.artistName ?? "")
                            .foregroundColor(.gray)
                            .font(.system(size: 10, weight: .light))
                            .lineLimit(1)
                            .truncationMode(.tail)
                    }
                    .frame(width: 120)
                    Divider()
                    //언어, 대표언어, +n개. 언어
                    VStack(spacing: 8) {
                        Text("언어")
                            .foregroundColor(.gray)
                            .font(.system(size: 10, weight: .light))
                        AdditionalLangText(languages: appInfo.languageCodesISO2A ?? [])
                    }
                    .frame(width: 120)
                }//HStack ends
                .padding(.bottom, 16)
            }//ScrollView ends
            
            //스크린샷 페이징 가로스크롤
            if !urls.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        //Spacer(minLength: 16)
                        let imageDimenssion = self.imageDimenssions(url: urls.first!)
                        if imageDimenssion.width >= imageDimenssion.height {
                            //가로 뷰 스크린샷들
                            //거의 화면 너비를 가득 채운다
                            let imageWidth = UIScreen.main.bounds.size.width - 32
                            let imageHeight = (UIScreen.main.bounds.size.width - 32)*6/11
                            
                            ForEach(urls, id: \.self) { urlString in
                                KFImageView(url: urlString)
                                    .frame(width: imageWidth, height:imageHeight)
                                    .scaledToFill()
                                    .cornerRadius(15)
                            }
                        } else {
                            //세로 뷰 스크린샷들
                            //화면 전체 크기의 1/2 만큼 높이를 가진다
                            //가로:세로 = 6 : 11
                            let imageWidth = UIScreen.main.bounds.size.height*3/11
                            let imageHeight = UIScreen.main.bounds.size.height/2
                            ForEach(urls, id: \.self) { urlString in
                                KFImageView(url: urlString)
                                    .frame(width: imageWidth, height: imageHeight)
                                    .scaledToFill()
                                    .cornerRadius(15)
                            }
                        }
                        //Spacer(minLength: 16)
                    }
                }
                .padding(.bottom)
                .onAppear {
                    UIScrollView.appearance().isPagingEnabled = true
                }
            } else {
                EmptyView()
            }
            
        }
        
    }
}

extension InfoScreenshotCell {
    //url을 받고 너비와 높이를 반환해주는 함수, (0, 0)을 반환하면 실패
    private func imageDimenssions(url: String) -> (width: Int, height: Int) {
        if let imgSource = CGImageSourceCreateWithURL(URL(string: url)! as CFURL , nil) {
            if let imageProperties = CGImageSourceCopyPropertiesAtIndex(imgSource, 0, nil) as Dictionary? {
                let pixelWidth = imageProperties[kCGImagePropertyPixelWidth] as! Int
                let pixelHeight = imageProperties[kCGImagePropertyPixelHeight] as! Int
                return (pixelWidth, pixelHeight)
            }
        }
        return (0, 0)
    }
}
