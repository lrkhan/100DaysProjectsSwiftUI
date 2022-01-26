//
//  VibrationsView.swift
//  Flashzilla
//
//  Created by Luthfor Khan on 1/12/22.
//

import SwiftUI

struct VibrationsView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture(perform: simpleSuccess)
    }
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        // can replace .success with .error or .warning
    }
}

struct VibrationsView_Previews: PreviewProvider {
    static var previews: some View {
        VibrationsView()
    }
}
