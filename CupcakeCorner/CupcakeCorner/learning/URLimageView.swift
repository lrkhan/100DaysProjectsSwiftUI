//
//  URLimageView.swift
//  CupcakeCorner
//
//  Created by Luthfor Khan on 12/26/21.
//

import SwiftUI

struct URLimageView: View {
    private let img = ["logo.png", "bad.png"]
    
    private var choice: String {
        img[Int.random(in: 0...1)]
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            AsyncImage(url: URL(string: "https://hws.dev/img/\(choice)")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else if phase.error != nil {
                    Text("There was an error loading the image.")
                } else {
                    ProgressView()
                }
            }
            .frame(width: 200, height: 200)
            
            Spacer()
            
            Text(choice)
            
            Spacer()
        }
    }
}

struct URLimageView_Previews: PreviewProvider {
    static var previews: some View {
        URLimageView()
    }
}
