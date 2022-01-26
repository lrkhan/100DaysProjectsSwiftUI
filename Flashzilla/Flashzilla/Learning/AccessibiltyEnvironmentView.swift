//
//  AccessibiltyEnvironmentView.swift
//  Flashzilla
//
//  Created by Luthfor Khan on 1/24/22.
//

import SwiftUI

struct AccessibiltyEnvironmentView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    
    var body: some View {
        HStack {
            if differentiateWithoutColor {
                Image(systemName: "checkmark.circle")
            }
            
            Text("Success")
        }
        .padding()
        .background(differentiateWithoutColor ? .black : .green)
        .foregroundColor(.white)
        .clipShape(Capsule())
    }
}

struct AccessibiltyEnvironmentView_Previews: PreviewProvider {
    static var previews: some View {
        AccessibiltyEnvironmentView()
    }
}
