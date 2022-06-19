//
//  SearchView.swift
//  iTunesSearchTabMockApp
//
//  Created by 조선우 (SunWoo Cho) on 2022/06/07.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText: String = ""
    @StateObject private var iTunesAPI = iTunesAPIMediator.shared
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("게임, 앱, 스토리 등",
                          text: $searchText)
                    .textFieldStyle(.roundedBorder)
                    .padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
                    .onChange(of: searchText, perform: { searchText in
                        iTunesAPI.searchRequest(term: searchText)
                    })
                
                ScrollView {
                    LazyVStack {
                        ForEach(iTunesAPI.resultList.results, id: \.trackId) { item in
                            NavigationLink(destination: DetailView(appInfo: item)) {
                                SearchListCell(appInfo: item)
                                    .frame(height: UIScreen.main.bounds.height*0.45)
                            }
                        }
                    }
                }
            }
            .navigationTitle("검색")
            .navigationBarTitleDisplayMode(.large)
            .navigationViewStyle(.stack)
            //.padding(.trailing, -32)    //disclosure indicator 숨기기
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
