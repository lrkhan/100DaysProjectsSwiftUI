//
//  TextGuesturesView.swift
//  Animations
//
//  Created by Luthfor Khan on 12/15/21.
//

import SwiftUI

struct TextGuesturesView: View {
    let letters = Array("Hello, SwiftUI")
    @State private var dragAmount = CGSize.zero
    @State private var enable = false
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count){num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enable ? .blue : .red)
                    .offset(dragAmount)
                    .animation(.default.delay(Double(num)/20), value: dragAmount)
            }
        }
        .gesture(
                    DragGesture()
                        .onChanged { dragAmount = $0.translation }
                        .onEnded { _ in
                            dragAmount = .zero
                            enable.toggle()
                        }
                )
    }
}

struct TextGuesturesView_Previews: PreviewProvider {
    static var previews: some View {
        TextGuesturesView()
    }
}
