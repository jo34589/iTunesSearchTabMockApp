//
//  SwiftUIView.swift
//  iTunesSearchTabMockApp
//
//  Created by 조선우 (SunWoo Cho) on 2022/06/09.
//

import SwiftUI

struct RateView: View {
    
    var rate: Double
    var fontSize: CGFloat
    var rateString: String {
        return String(format: "%.1f", ((rate*10).rounded()/10))
    }
    
    var body: some View {
        Text(rateString)
            .foregroundColor(.gray)
            .font(.system(size: fontSize, weight: .bold, design: .rounded))
    }
}
