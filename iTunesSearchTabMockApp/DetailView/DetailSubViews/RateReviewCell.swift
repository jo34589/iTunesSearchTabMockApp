//
//  SwiftUIView.swift
//  iTunesSearchTabMockApp
//
//  Created by 조선우 (SunWoo Cho) on 2022/06/10.
//

import SwiftUI

struct RateReviewCell: View {
    
    let appInfo: iTunesResult
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("평가 및 리뷰")
                .font(.system(size: 24, weight: .bold))
            RateView(rate: appInfo.averageUserRating ?? 0, fontSize: 60)
        }
        .padding()
    }
}
