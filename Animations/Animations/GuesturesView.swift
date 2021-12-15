//
//  GuesturesView.swift
//  Animations
//
//  Created by Luthfor Khan on 12/15/21.
//

import SwiftUI

struct GuesturesView: View {
    // store the location of the uers finger when they drag
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        // add the modifier
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in dragAmount = .zero }
            )
            .animation(.spring(), value: dragAmount)
    }
}

struct GuesturesView_Previews: PreviewProvider {
    static var previews: some View {
        GuesturesView()
    }
}
