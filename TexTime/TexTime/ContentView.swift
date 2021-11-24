//
//  ContentView.swift
//  TexTime
//
//  Created by Cédric Bahirwe on 24/11/2021.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    HStack {
                        VLabelButton("Create Link",
                                     icon: "link") { }
                                     .withBackground(Material.ultraThinMaterial)
                        
                        VLabelButton("New TextTime", icon: "message.fill") { }
                        .withBackground(.cyan)
                    }
                }
                .padding(.horizontal)
//                .redacted(reason: .placeholder)
                
                VStack(alignment: .leading) {
                    DiscussionSectionView(title: "This Month")
                    
                    DiscussionSectionView(title: "Last Month")
                }.padding()
            }
            .background(LiveBackgroundView())
            .navigationTitle(Text("TextTime"))
        }
        .accentColor(.red)
//        .redacted(reason: .placeholder)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
