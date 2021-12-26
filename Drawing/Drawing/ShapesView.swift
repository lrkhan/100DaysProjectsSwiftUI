//
//  ShapesView.swift
//  Drawing
//
//  Created by Luthfor Khan on 12/25/21.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct Square: Shape {
    func path(in tri: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: tri.minX, y: tri.minY))
        path.addLine(to: CGPoint(x: tri.minX, y: tri.maxY))
        path.addLine(to: CGPoint(x: tri.maxX, y: tri.maxY))
        path.addLine(to: CGPoint(x: tri.maxX, y: tri.minY))
        path.addLine(to: CGPoint(x: tri.minX, y: tri.minY))
        
        return path
    }
}

struct ShapesView: View {
    var body: some View {
        Triangle()
            .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .frame(width: 200, height: 200)
    }
}

struct ShapesView_Previews: PreviewProvider {
    static var previews: some View {
        ShapesView()
    }
}
