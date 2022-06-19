//
//  KFImageView.swift
//  iTunesSearchTabMockApp
//
//  Created by jhsong on 2020/09/08.
//  Copyright © 2020 Veaver. All rights reserved.

import SwiftUI
import Kingfisher
import class Kingfisher.KingfisherManager

struct KFImageView: View {
    let url :String
    //var defaultImage = "icDefaultLogo01"
    
    var body: some View {
        KFImage(URL(string: url))
        .onSuccess { r in
        // r: RetrieveImageResult
            print("success")
            print("height: \(r.image.size.height)")
            print("width: \(r.image.size.width)")
            //print("success: \(r)")
        }
        .onFailure { e in
            // e: KingfisherError
            print("failure: \(e) url:\(url)")
        }
        //.placeholder{Image(defaultImage).resizable()}
        .resizable()
    }
}
