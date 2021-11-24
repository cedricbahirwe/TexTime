//
//  VLabelButton.swift
//  TexTime
//
//  Created by Cédric Bahirwe on 24/11/2021.
//

import SwiftUI

struct VLabelButton: View {
    private let title: String
    private let icon: String
    private var action: () -> Void
    
    init(_ title: String,
         icon: String,
         action: @escaping () -> Void) {
        self.title = title
        self.icon = icon
        self.action = action
    }
    
    private var buttonContent: some View {
        Button(action: action) {
            VStack(spacing: 2) {
                Image(systemName: icon)
                Text(title)
                    .font(.caption.weight(.semibold))
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 60)
        }
    }
    
    var body: some View {
        buttonContent
            .background(Color.teal)
            .cornerRadius(8)
    }
    
    func withBackground(_ color: Color) -> some View {
        buttonContent
            .background(color)
            .cornerRadius(8)
    }
    
    func withBackground(_ material: Material) -> some View {
        buttonContent
            .background(material)
            .cornerRadius(8)
    }
    
    func withBackground<T: View>(@ViewBuilder backgroundView: () -> T) -> some View {
        buttonContent
            .background(backgroundView())
            .cornerRadius(8)
    }
    
}


struct VLabelButton_Previews: PreviewProvider {
    static var previews: some View {
        VLabelButton("Title", icon: "link") { }
    }
}
