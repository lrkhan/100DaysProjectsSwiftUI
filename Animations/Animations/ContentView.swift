//
//  ContentView.swift
//  Animations
//
//  Created by Luthfor Khan on 12/15/21.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        NavigationView{
            List{
                Section("Upscaling button") {
                    ButtonStepperView()
                        .frame(height: 300.0)
                }
                
                Section("Ring Button"){
                    HStack {
                        Spacer()
                        ButtonRingView()
                            .frame(height: 300.0)
                        Spacer()
                    }
                }
                
                Section("3D Button"){
                    HStack {
                        Spacer()
                        ButtonSpinView()
                            .frame(height: 300.0)
                        Spacer()
                    }
                }
                
                Section("Guesture"){
                    HStack {
                        Spacer()
                        GuesturesView()
                            .frame(height: 300.0)
                        Spacer()
                    }
                }
                
                Section("Text with Guesture"){
                    HStack {
                        Spacer()
                        TextGuesturesView()
                            .frame(height: 300.0)
                        Spacer()
                    }
                }
                
                Section("Transitions Hidden"){
                    HStack {
                        Spacer()
                        AsymetricTranView()
                            .frame(height: 300.0)
                        Spacer()
                    }
                }
                
                Section("Custom Animation"){
                    HStack {
                        Spacer()
                        CustomTransitionView()
                            .frame(height: 300.0)
                        Spacer()
                    }
                }
            }
            
            .navigationTitle("Animaitons")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
