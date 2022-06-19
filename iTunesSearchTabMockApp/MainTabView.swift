//
//  MainTabView.swift
//  iTunesSearchTabMockApp
//
//  Created by 조선우 (SunWoo Cho) on 2022/06/07.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            DummyView(title: Binding.constant("투데이"))
                .tabItem {
                    
                    Label("투데이", systemImage: "newspaper")
                        //.symbolRenderingMode(.)
                }
            DummyView(title: Binding.constant("게임"))
                .tabItem {
                    
                    Label("게임", systemImage: "rosette")
                }
            DummyView(title: Binding.constant("앱"))
                .tabItem {
                    
                    Label("앱", systemImage: "square.stack.3d.up.fill")
                }
            DummyView(title: Binding.constant("Arcade"))
                .tabItem {
                    
                    Label("Arcade", systemImage: "gamecontroller")
                }
            
            //search tab
            SearchView()
                .tabItem {
                    Label("검색", systemImage: "magnifyingglass")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

