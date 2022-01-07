//
//  tabView.swift
//  HotProspects
//
//  Created by Luthfor Khan on 1/7/22.
//

import SwiftUI

struct tabView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            Text("Tab1,\n selection: \(selection)")
                .tabItem{Label("One", systemImage: "star")}
                .tag(0)
            Text("Tab2,\n selection: \(selection)")
                .tabItem{Label("Two", systemImage: "circle")}
                .tag(1)
        }
    }
}

struct tabView_Previews: PreviewProvider {
    static var previews: some View {
        tabView()
    }
}
