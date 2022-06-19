//
//  AdditionalLangText.swift
//  iTunesSearchTabMockApp
//
//  Created by 조선우 (SunWoo Cho) on 2022/06/09.
//

import SwiftUI

struct AdditionalLangText: View {
    
    var languages: [String]
    var firstLang: String {
        if languages.contains("KO") {
            return "KO"
        } else {
            if languages.isEmpty {return " "}
            else {
                return languages.randomElement()!
            }
        }
    }
    var languageBottomString: String {
        let n = languages.count
        if n > 1 {
            return "+\(n-1)개의 언어"
        } else if n == 1 {
            return " "
        } else {
            //isEmpty
            return "지원하는 언어 없음"
        }
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Text(firstLang)
                .foregroundColor(.gray)
                .font(.system(size: 24, weight: .bold, design: .rounded))
            Text(languageBottomString)
                .foregroundColor(.gray)
                .font(.system(size: 10, weight: .light))
        }
    }
}
