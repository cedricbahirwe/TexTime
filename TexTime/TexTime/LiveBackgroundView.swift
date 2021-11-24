//
//  LiveBackgroundView.swift
//  TexTime
//
//  Created by Cédric Bahirwe on 24/11/2021.
//

import SwiftUI

struct LiveBackgroundView: View {
    var body: some View {
        ZStack {
            LiveVideoView()
                .overlay(Material.ultraThinMaterial)
//            Color.clear
//                .background(Material.ultraThinMaterial)
        }
        .ignoresSafeArea()
        
    }
}

struct LiveBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        LiveBackgroundView()
    }
}
