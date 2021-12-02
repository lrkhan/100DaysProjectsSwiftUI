//
//  Sandbox.swift
//  WeSplit
//
//  Created by Luthfor Khan on 12/2/21.
//

import SwiftUI

struct Sandbox: View {
    @State private var tapCount = 0
    
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
    }
}

struct Sandbox_Previews: PreviewProvider {
    static var previews: some View {
        Sandbox()
    }
}
