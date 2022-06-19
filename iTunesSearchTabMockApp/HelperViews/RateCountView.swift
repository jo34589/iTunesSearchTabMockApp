//
//  RateCountView.swift
//  iTunesSearchTabMockApp
//
//  Created by 조선우 (SunWoo Cho) on 2022/06/08.
//

import SwiftUI

struct RateCountView: View {
    
    var count: Int
    var userCountText: String {
        var count_d = Double(count)
        if count > 10000 {
            count_d /= 1000
            count_d = count_d.rounded()
            count_d /= 10
            return String(format: "%.1f만 명", count_d)
        } else if count > 1000 {
            count_d /= 100
            count_d = count_d.rounded()
            count_d /= 10
            return String(format: "%.1f천 명", count_d)
        } else {
            return "\(count) 명"
        }
    }
    
    var body: some View {
        Text(userCountText)
            .foregroundColor(.gray)
            .font(.system(size: 12, weight: .light))
    }
}

struct RateCountView_Previews: PreviewProvider {
    static var previews: some View {
        RateCountView(count: 45980)
            .previewLayout(.fixed(width: 100, height: 20))
    }
}
