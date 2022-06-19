//
//  DummyView.swift
//  iTunesSearchTabMockApp
//
//  Created by 조선우 (SunWoo Cho) on 2022/06/07.
//

import SwiftUI

struct DummyView: View {
    
    @Binding var title: String
    
    var body: some View {
        Text(title)
            .font(.headline)
    }
}

struct DummyView_Previews: PreviewProvider {
    static var previews: some View {
        DummyView(title: Binding.constant("Title"))
    }
}
