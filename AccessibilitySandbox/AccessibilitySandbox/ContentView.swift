//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Luthfor Khan on 1/5/22.
//

import SwiftUI

struct ContentView: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]

    @State private var selectedPicture = Int.random(in: 0...3)
    
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks",
    ]

    var body: some View {
        Image(pictures[selectedPicture])
            .resizable()
            .scaledToFit()
            .accessibilityLabel(labels[selectedPicture])
            .accessibilityAddTraits(.isButton)
            .onTapGesture {
                selectedPicture = Int.random(in: 0...3)
            }
    }
    
    // how to hide and group accessibility information
    // use image decorative tag: Image(decorative: "character")
    // or add .accessibilityHidden(true)
    // grouping could be done as: .accessibilityElement(children: .combine)
    // or read as a single item: .accessibilityElement(children: .ignore)
    // followed by: .accessibilityLabel("Your score is 1000")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
