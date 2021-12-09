//
//  ContentView.swift
//  Converter-Challenge1
//
//  Created by Luthfor Khan on 12/9/21.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var userInputFocued: Bool
    
    @State private var userMeasurement = 0.0
    @State private var convertedMeasurement = 0.0
    @State private var userUnits = ""
    @State private var convertUnits = ""
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    HStack {
                        TextField("temperature", value: $userMeasurement, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($userInputFocued)
                        
                        Picker("User Temperature Units", selection: $userUnits) {
                            ForEach(temperatureUnits, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                }
                
                Section{
                    Text((tempVal(userValue: userMeasurement, userUnits: userUnits, desiredUnits: convertUnits)), format: .number)
                } header: {
                    Text("Converted Temperature")
                }
                
                Section{
                    Picker("Converted Temperature Units", selection: $convertUnits) {
                        ForEach(temperatureUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Choose Output Unit")
                }
            }
            .navigationTitle("Temperature")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        userInputFocued = false
                    }
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
