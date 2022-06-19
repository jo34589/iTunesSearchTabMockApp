//
//  StarRateView.swift
//  iTunesSearchTabMockApp
//
//  Created by 조선우 (SunWoo Cho) on 2022/06/08.
//

import SwiftUI

struct StarRateView: View {
    
    var rate: Double
    
    var body: some View {
        //진짜 이게 최선일까.
        //진짜?
        //Really?
        HStack(alignment: .center, spacing: 0){
            //star.leadinghalf.filled : iOS 15+
            //star.leadinghalf.fill   : iOS 14+
            Group {
                //1
                if rate < 0.3 {
                    Image(systemName: "star")
                        .resizable()
                        .scaledToFit()
                } else if rate >= 0.3 && rate <= 0.7 {
                    Image(systemName: "star.leadinghalf.fill")
                        .resizable()
                        .scaledToFit()
                } else {
                    Image(systemName: "star.fill")
                        .resizable()
                        .scaledToFit()
                }
                //2
                if rate < 1.3 {
                    Image(systemName: "star")
                        .resizable()
                        .scaledToFit()
                } else if rate >= 1.3 && rate <= 1.7 {
                    Image(systemName: "star.leadinghalf.fill")
                        .resizable()
                        .scaledToFit()
                } else {
                    Image(systemName: "star.fill")
                        .resizable()
                        .scaledToFit()
                }
                //3
                if rate < 2.3 {
                    Image(systemName: "star")
                        .resizable()
                        .scaledToFit()
                } else if rate >= 2.3 && rate <= 2.7 {
                    Image(systemName: "star.leadinghalf.fill")
                        .resizable()
                        .scaledToFit()
                } else {
                    Image(systemName: "star.fill")
                        .resizable()
                        .scaledToFit()
                }
                //4
                if rate < 3.3 {
                    Image(systemName: "star")
                        .resizable()
                        .scaledToFit()
                } else if rate >= 3.3 && rate <= 3.7 {
                    Image(systemName: "star.leadinghalf.fill")
                        .resizable()
                        .scaledToFit()
                } else {
                    Image(systemName: "star.fill")
                        .resizable()
                        .scaledToFit()
                }
                //5
                if rate < 4.3 {
                    Image(systemName: "star")
                        .resizable()
                        .scaledToFit()
                } else if rate >= 4.3 && rate <= 4.7 {
                    Image(systemName: "star.leadinghalf.fill")
                        .resizable()
                        .scaledToFit()
                } else {
                    Image(systemName: "star.fill")
                        .resizable()
                        .scaledToFit()
                }
            }
            .frame(width: 14, height: 14)
            .foregroundColor(.gray)
        }
    }
}

struct StarRateView_Previews: PreviewProvider {
    static var previews: some View {
        StarRateView(rate: 1.5)
            .previewLayout(.fixed(width: 100, height: 20))
    }
}
