//
//  ButtonSpinView.swift
//  Animations
//
//  Created by Luthfor Khan on 12/15/21.
//

import SwiftUI

struct ButtonSpinView: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap Me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 10)){
                animationAmount += 360.0
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

struct ButtonSpinView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSpinView()
    }
}
