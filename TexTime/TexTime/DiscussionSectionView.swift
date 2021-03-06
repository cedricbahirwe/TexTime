//
//  DiscussionSectionView.swift
//  TexTime
//
//  Created by Cédric Bahirwe on 24/11/2021.
//

import SwiftUI

struct DiscussionSectionView: View {
    let title: String
    var items: Int = (1...5).map{$0}.randomElement()!

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.caption)
                    .textCase(.uppercase)
                    .foregroundColor(.secondary)
                    .padding(.leading)
                
                Spacer()
            }
            
            VStack(spacing: 0) {
                ForEach(0..<items) { item in
                    DiscussionRowView(item: item)
                        .padding(12)
                    if item != items-1 {
                        Divider().padding(.leading)
                    }
                }
            }
            .background(.ultraThinMaterial)
            .cornerRadius(10)
        }
        .padding(.top, 12)
    }
}

extension DiscussionSectionView {
    struct DiscussionRowView: View {
        let item: Int
        var body: some View {
            HStack {
                ZStack {
                    Circle()
                    Text("CL")
                        .font(.system(.callout, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                .frame(width: 38, height: 38)
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("Christiana Nabintu")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .lineLimit(1)
                    
                    HStack(spacing: 3) {
                        Image(systemName: "message.fill")
                            .imageScale(.small)
                        Text("TexTime Message")
                            .font(.callout.weight(.regular))
                    }
                    .foregroundColor(.secondary)
                    
                }
                
                Spacer()
                
                HStack(spacing: 5) {
                    Text("11/6/2021")
                        .font(.callout.weight(.regular))
                        .foregroundColor(.secondary)
                    Image(systemName: "info.circle")
                        .imageScale(.large)
                        .foregroundColor(.cyan)
                    
                    
                }
            }
        }
    }
}

struct DiscussionSectionView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DiscussionSectionView(title: "Title")
                .padding()
                .frame(maxHeight: .infinity)
                .background(Color.black.opacity(0.8))
        }
    }
}
