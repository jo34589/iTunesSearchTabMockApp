//
//  ScreenshotView.swift
//  iTunesSearchTabMockApp
//
//  Created by 조선우 (SunWoo Cho) on 2022/06/09.
//

import SwiftUI

//앱의 미리보기 스크린샷을 띄우는 부분
//조건:  미리보기 이미지들이 주어진 경우 띄움, 없다면 띄우지 않음.
//      가로뷰로 주어진 스크린샷이라면 한 장만, 세로뷰면 최대 3장을 띄움
struct ScreenshotView: View {
    
    let urls: [String]
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 16) {
                let imageDimenssion = self.imageDimenssions(url: urls.first!)
                if imageDimenssion.width >= imageDimenssion.height {
                    
                    KFImageView(url: urls.first!)
                        .frame(width: geometry.size.width - 16, height: geometry.size.height)
                        .scaledToFill()
                        .cornerRadius(10)
                } else if imageDimenssion.width < imageDimenssion.height && imageDimenssion.height > 0 {
                    
                    KFImageView(url: urls.first!)
                        .frame(width: geometry.size.width/3 - 16, height: geometry.size.height)
                        .scaledToFill()
                        .cornerRadius(10)
                    if urls.count > 1, let secondUrl = urls[1] {
                        KFImageView(url: secondUrl)
                            .frame(width: geometry.size.width/3 - 16, height: geometry.size.height)
                            .scaledToFill()
                            .cornerRadius(10)
                    } else {
                        Spacer()
                    }
                    if urls.count > 2, let thirdUrl = urls[2] {
                        KFImageView(url: thirdUrl)
                            .frame(width: geometry.size.width/3 - 16, height: geometry.size.height)
                            .scaledToFill()
                            .cornerRadius(10)
                    } else {
                        Spacer()
                    }
                } else {
                    //설마 너비와 높이가 - 로 나오겠...어?
                    //0, 0
                    //표시할 이미지 없음
                }
            }
        }
    }
}

extension ScreenshotView {
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

struct ScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenshotView(urls: sampleResult.results[0].screenshotUrls!)
    }
}
