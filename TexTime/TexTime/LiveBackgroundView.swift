//
//  LiveBackgroundView.swift
//  TexTime
//
//  Created by Cédric Bahirwe on 24/11/2021.
//

import SwiftUI

struct LiveBackgroundView: View {
    @Environment(\.scenePhase) var scenePhase

    var transluscentOverlay: Material {
        scenePhase == .active ? .ultraThinMaterial : .ultraThickMaterial
    }
    var body: some View {
        LiveVideoView()
            .overlay(transluscentOverlay)
            .ignoresSafeArea()
    }
}

struct LiveBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        LiveBackgroundView()
    }
}
