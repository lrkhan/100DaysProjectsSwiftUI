//
//  ContentView.swift
//  WeSplit
//
//  Created by Luthfor Khan on 12/2/21.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var amountIsFocused: Bool
    
    @State private var saveData: [Double] = []
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let people = Double(numberOfPeople + 2)
        
        let cost: Double = (checkAmount/people) * (1.0 + (Double(tipPercentage)/100.0))
        // calculate the total per person here
        return cost
    }
    
    var totalPlusTip: Double {
        return (checkAmount * (1.0+Double(tipPercentage)/100.0))
    }
    
    var body: some View {
        NavigationView {
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< 101) {
                            Text($0, format: .percent)
                        }
                    }
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Amount per Person")
                }
                
                Section{
                    Text(totalPlusTip, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Total + Tip")
                }
                
                Section{
                    Button(action: {
                        saveData.append(totalPlusTip)
                        print(saveData)
                    }) {
                        HStack {
                            Spacer()
                            Text("Save Total")
                            Spacer()
                        }
                    }
                }
                
                Section{
                    NavigationLink("Past Totals", destination: HistoryView(saveData: saveData))
                } header: {
                    Text("Check History")
                }
            }
            
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
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
