//
//  AsymetricTranView.swift
//  Animations
//
//  Created by Luthfor Khan on 12/15/21.
//

import SwiftUI

struct AsymetricTranView: View {
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation{
                    isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    //.transition(.scale)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

struct AsymetricTranView_Previews: PreviewProvider {
    static var previews: some View {
        AsymetricTranView()
    }
}
