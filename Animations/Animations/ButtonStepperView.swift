//
//  ButtonStepperView.swift
//  Animations
//
//  Created by Luthfor Khan on 12/15/21.
//

import SwiftUI

struct ButtonStepperView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            // stepper smoothly animates the button
            Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
            
            Spacer()
            
            // button just abruptly increses the size
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}

struct ButtonStepperView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStepperView()
    }
}
