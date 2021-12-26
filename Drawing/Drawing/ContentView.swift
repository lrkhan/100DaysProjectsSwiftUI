//
//  ContentView.swift
//  Drawing
//
//  Created by Luthfor Khan on 12/21/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 3
    var body: some View {
        TabView(selection: $selection) {
            FlowerView().tabItem {
                Text("Flower")
            }.tag(1)
            BoardView().tabItem {
                Text("Board")
                
            }.tag(2)
            SpirographView().tabItem {
                Text("Spiro")
                
            }.tag(3)
            ColorView().tabItem {
                Text("Color")
                
            }.tag(4)
            BlendView().tabItem {
                Text("Blend")
                
            }.tag(5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
