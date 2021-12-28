//
//  BindingVeiw.swift
//  Bookworm
//
//  Created by Luthfor Khan on 12/27/21.
//

import SwiftUI

struct PushButtonBind: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct PushButton: View {
    let title: String
    @State var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct BindingVeiw: View {
    @State private var rememberMe = false
    
    var body: some View {
        VStack {
            Group{
                PushButton(title: "Remember Me @State", isOn: rememberMe)
                    .padding()
                
                PushButtonBind(title: "Remember Me @Binding", isOn: $rememberMe)
                    .padding()
            }
            Group {
                
                Text("Rememberme Value: \(rememberMe ? "On" : "Off")")
                    .padding()
            }
        }
    }
}

struct BindingVeiw_Previews: PreviewProvider {
    static var previews: some View {
        BindingVeiw()
    }
}
