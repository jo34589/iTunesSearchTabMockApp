//
//  Network.swift
//  iTunesSearchTabMockApp
//
//  Created by 조선우 (SunWoo Cho) on 2022/06/07.
//

import Foundation
import Alamofire

class iTunesAPIMediator: ObservableObject {
    
    static let shared = iTunesAPIMediator()
    
    @Published var resultList: iTunesResultList = iTunesResultList(resultCount: 0, results: [])
    
    //검색어term 과 지정된 숫자num 을 이용해 검색하고 결과를 completion으로 넘기는 함수였음.
    //SwiftUI 용으로 구독하는 뷰들이 업데이트하도록 completion 클로저 삭제, publish 된 프로퍼티에 저장.
    func searchRequest(term: String) -> Void {
        
        let param: Parameters = [
            "term": term,
            "country": "KR",
            "media": "software",
            "entity": "software",
        ]
        
        let request = AF.request("https://itunes.apple.com/search", method: .get, parameters: param)
        
        request.responseData { response in
            switch response.result {
            case let .success(result):
                debugPrint("success: \(result)")
                let decoder = JSONDecoder()
                do {
                    let searchResults = try decoder.decode(iTunesResultList.self, from: result)
                    //completion(searchResults)
                    //검색 결과가 제대로 파싱된 상태
                    self.resultList = searchResults
                } catch let e {
                    debugPrint("decoding failed: \(e.localizedDescription)")
                    //completion(nil)
                }
            case let .failure(error):
                debugPrint("request failed with: \(error)")
                //completion(nil)
            }
        }
    }
}

