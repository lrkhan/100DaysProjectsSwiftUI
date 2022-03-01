//
//  NavView.swift
//  SnowSeeker
//
//  Created by Luthfor Khan on 3/1/22.
//

import SwiftUI

struct NavView: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                Text("New secondary")
            } label: {
                Text("Hello, World!")
            }
            .navigationTitle("Primary")

            Text("Secondary")
            
            Text("Tri")
        }
    }
}

struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        NavView()
    }
}
