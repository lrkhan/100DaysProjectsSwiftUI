//
//  FlowerView.swift
//  Drawing
//
//  Created by Luthfor Khan on 12/25/21.
//

import SwiftUI

struct Flower: Shape {
    // How much to move this petal away from the center
    var petalOffset: Double = -20
    
    // How wide to make each petal
    var petalWidth: Double = 100
    
    // number of petals
    var numPetals: Double = 16.0
    
    // animation
    var animatableData: Double {
        get { numPetals }
        set { numPetals = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        // The path that will hold all petals
        var path = Path()
        
        // Count from 0 up to pi * 2, moving up pi / 8 each time
        for number in stride(from: 0, to: Double.pi * 2, by: (Double.pi * 2) / numPetals) {
            // rotate the petal by the current value of our loop
            let rotation = CGAffineTransform(rotationAngle: number)
            
            // move the petal to be at the center of our view
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            // create a path for this petal using our properties plus a fixed Y and height
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
            
            // apply our rotation/position transformation to the petal
            let rotatedPetal = originalPetal.applying(position)
            
            // add it to our main path
            path.addPath(rotatedPetal)
        }
        
        // now send the main path back
        return path
    }
}

struct FlowerView: View {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    @State private var numPetals = 16.0
    
    var body: some View {
        VStack {
            Flower(petalOffset: petalOffset, petalWidth: petalWidth, numPetals: numPetals)
                .fill(.blue, style: FillStyle(eoFill: true))
                .frame(width: 300.0, height: 400.0)
            
            
            HStack {
                Text("Number of Petals")
                Text(String(numPetals))
            }
            Slider(value: $numPetals, in: 2...50)
                .padding([.horizontal, .bottom])
            
            HStack {
                Text("Offset")
                Text(String(petalOffset))
            }
            Slider(value: $petalOffset, in: -100...100)
                .padding([.horizontal, .bottom])
            
            HStack {
                Text("Width")
                Text(String(petalWidth))
            }
            Slider(value: $petalWidth, in: 1...200)
                .padding(.horizontal)
            
            Button {
                withAnimation {
                    petalWidth = 100.0
                    petalOffset = -20.0
                    numPetals = 16.0
                }
            } label: {
                Text("Reset")
                    .font(.title)
            }
        }
    }
}

struct FlowerView_Previews: PreviewProvider {
    static var previews: some View {
        FlowerView()
    }
}
