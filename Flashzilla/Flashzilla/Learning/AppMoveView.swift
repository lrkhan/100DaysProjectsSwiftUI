//
//  AppMoveView.swift
//  Flashzilla
//
//  Created by Luthfor Khan on 1/24/22.
//

import SwiftUI

struct AppMoveView: View {
    // read the envirnment key
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onChange(of: scenePhase) { newPhase in
                if newPhase == .active {
                    print("Active")
                } else if newPhase == .inactive {
                    print("Inactive")
                } else if newPhase == .background {
                    print("Background")
                }
            }
    }
}

struct AppMoveView_Previews: PreviewProvider {
    static var previews: some View {
        AppMoveView()
    }
}
