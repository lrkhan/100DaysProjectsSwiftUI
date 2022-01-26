//
//  HitView.swift
//  Flashzilla
//
//  Created by Luthfor Khan on 1/12/22.
//

import SwiftUI

struct HitView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Rectangle tapped!")
                }

            Circle()
                .fill(.red)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Circle tapped!")
                }
            // miss the circle view
            // .allowsHitTesting(false)
            
            // contet shape can be diffrent and used for spacers
            //   .contentShape(Rectangle())
            // add before the onTapGesture
        }
    }
}

struct HitView_Previews: PreviewProvider {
    static var previews: some View {
        HitView()
    }
}
