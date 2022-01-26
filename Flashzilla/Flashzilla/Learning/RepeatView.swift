//
//  RepeatView.swift
//  Flashzilla
//
//  Created by Luthfor Khan on 1/24/22.
//

import SwiftUI

struct RepeatView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var counter = 0
    
    
    var body: some View {
        Text("Hello, World!")
            .onReceive(timer) { time in
                if counter == 5 {
                    timer.upstream.connect().cancel()
                } else {
                    print("The time is now \(time)")
                }
                
                counter += 1
            }
    }
}

struct RepeatView_Previews: PreviewProvider {
    static var previews: some View {
        RepeatView()
    }
}
