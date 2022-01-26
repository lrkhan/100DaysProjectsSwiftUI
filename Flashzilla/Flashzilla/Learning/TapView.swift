//
//  GesturesView.swift
//  Flashzilla
//
//  Created by Luthfor Khan on 1/12/22.
//

import SwiftUI

struct TapView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            /*.onTapGesture(count: 2) {
                    print("Double tapped!")
                }
             or
             .onLongPressGesture {
                     print("Long pressed!")
                 }
             or
                 .onLongPressGesture(minimumDuration: 2) {
                     print("Long pressed!")
                 }
             */
        /*
         .onLongPressGesture(minimumDuration: 1) {
             print("Long pressed!")
         } onPressingChanged: { inProgress in
             print("In progress: \(inProgress)!")
         }
         As soon as you press down the change closure will be called with its parameter set to true.
         If you release before the gesture has been recognized (so, if you release after 1 second when using a 2-second recognizer), the change closure will be called with its parameter set to false.
         If you hold down for the full length of the recognizer, then the change closure will be called with its parameter set to false (because the gesture is no longer in flight), and your completion closure will be called too
         */
    }
}

struct TapView_Previews: PreviewProvider {
    static var previews: some View {
        TapView()
    }
}
