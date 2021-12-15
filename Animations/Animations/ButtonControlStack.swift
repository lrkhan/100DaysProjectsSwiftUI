//
//  ButtonControlStack.swift
//  Animations
//
//  Created by Luthfor Khan on 12/15/21.
//

import SwiftUI

struct ButtonControlStack: View {
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue: .red)
        .animation(.default, value: enabled)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60:0))
        .animation(.interpolatingSpring(stiffness: 5, damping: 10), value: enabled)
        
        // order matters - if the clip shape is added after animaiton then the shape will not be animated
    }
}

struct ButtonControlStack_Previews: PreviewProvider {
    static var previews: some View {
        ButtonControlStack()
    }
}
