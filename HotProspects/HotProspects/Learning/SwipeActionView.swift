//
//  SwipeActionView.swift
//  HotProspects
//
//  Created by Luthfor Khan on 1/10/22.
//

import SwiftUI

struct SwipeActionView: View {
    var body: some View {
        List {
            Text("Taylor Swift")
                .swipeActions {
                    Button(role: .destructive) {
                        print("Hi")
                    } label: {
                        Label("Delete", systemImage: "minus.circle")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button {
                        print("Hi")
                    } label: {
                        Label("Pin", systemImage: "pin")
                    }
                    .tint(.orange)
                }
        }
    }
}

struct SwipeActionView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeActionView()
            .preferredColorScheme(.dark)
    }
}
