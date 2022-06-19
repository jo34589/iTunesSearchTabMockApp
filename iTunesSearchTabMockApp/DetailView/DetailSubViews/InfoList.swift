//
//  InfoList.swift
//  iTunesSearchTabMockApp
//
//  Created by 조선우 (SunWoo Cho) on 2022/06/10.
//

import SwiftUI

struct InfoList: View {
    
    let appInfo: iTunesResult
    
    var fileSizeString: String {
        if let fileSize = Double(appInfo.fileSizeBytes ?? "") {
            var _fileSize = fileSize
            if _fileSize > 1024.0 {
                _fileSize /= 1024.0
                if _fileSize > 1024.0 {
                    _fileSize /= 1024.0
                    if _fileSize > 1024.0 {
                        _fileSize /= 1024.0
                        return String(format:"%.1fGB", _fileSize)
                    } else {
                        return String(format:"%.1fMB", _fileSize)
                    }
                } else {
                    return String(format:"%.1fKB", _fileSize)
                }
            } else {
                return String(format:"%.1fB", _fileSize)
            }
        } else {
            return ""
        }
    }
    
    var firstLang: String {
        guard let languages = appInfo.languageCodesISO2A else {
            return "지원하는 언어 없음"
        }
        if languages.contains("KO") {
            return "한국어 지원"
        } else {
            return "한국어 미지원"
        }
    }
    
    var deviceModel: String {
        let deviceModel = UIDevice.current.localizedModel
        return deviceModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("정보")
                .font(.system(size: 24, weight: .bold))
            HStack(alignment: .center, spacing: 10) {
                Text("제공자")
                Spacer()
                Text(appInfo.sellerName ?? "")
            }
        }
        HStack(alignment: .center, spacing: 10) {
            Text("크기")
            Spacer()
            Text(fileSizeString)
        }
        HStack(alignment: .center, spacing: 10) {
            Text("카테고리")
            Spacer()
            Text(appInfo.primaryGenreName ?? "")
        }
        HStack(alignment: .center, spacing: 10) {
            Text("호환성")
            Spacer()
            Text(deviceModel)
        }
        HStack(alignment: .center, spacing: 10) {
            Text("언어")
            Spacer()
            Text(String(firstLang))
        }
        HStack(alignment: .center, spacing: 10) {
            Text("연령등급")
            Spacer()
            Text(appInfo.contentAdvisoryRating ?? "")
        }
        /*
         HStack(alignment: .center, spacing: 10) {
             Text("개발자 웹 사이트")
             Spacer()
             Image(systemName: "safari")
         }
         */
        
    }
}
