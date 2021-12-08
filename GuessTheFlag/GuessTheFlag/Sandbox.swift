//
//  Sandbox.swift
//  GuessTheFlag
//
//  Created by Luthfor Khan on 12/8/21.
//

import SwiftUI

struct Sandbox: View {
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            Button("Button 1") { }
                .buttonStyle(.bordered)
            Button("Button 2", role: .destructive) { }
                .buttonStyle(.bordered)
            
            Button("Button 3") { }
                .buttonStyle(.borderedProminent)
            
            Button("Button 4", role: .destructive) { }
                .buttonStyle(.borderedProminent)
            Button{
                showingAlert.toggle()
                
            } label: {
                Label("Edit", systemImage: "pencil")
            }
            .alert("Important message", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Please read this.")
            }
        }
    }
    
    func executeDelete() {
        print("Now deleting…")
    }
}

struct Sandbox_Previews: PreviewProvider {
    static var previews: some View {
        Sandbox()
    }
}
