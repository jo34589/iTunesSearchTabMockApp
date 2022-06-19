//
//  DetailView.swift
//  iTunesSearchTabMockApp
//
//  Created by 조선우 (SunWoo Cho) on 2022/06/08.
//

import SwiftUI

struct DetailView: View {
    
    var appInfo: iTunesResult
    @State private var lookMore: Bool = false
    
    var body: some View {
        List{
            DetailViewHeader(appInfo: appInfo)
                .padding(.bottom)
                
            Group{
                InfoScreenshotCell(appInfo: appInfo)
                    .padding(.top)
            }
            Group{
                DescriptionDeveloperCell(appInfo: appInfo)
                    .padding(.top)
                    .padding(.bottom)
                    
            }
            Group {
                RateReviewCell(appInfo: appInfo)
                NewReleaseCell(appInfo: appInfo)
                    .padding()
                    
            }
            Group {
                InfoList(appInfo: appInfo)
                    .padding()
                    
            }
        }
        .listStyle(.plain)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(appInfo: sampleResult.results[0])
    }
}
