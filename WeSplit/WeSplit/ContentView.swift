//
//  ContentView.swift
//  WeSplit
//
//  Created by Luthfor Khan on 12/2/21.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var amountIsFocused: Bool
    
    @State private var saveData: [Double] = readData()
    @State private var checkAmount: Double = 0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var tipAmmount: Double {
        checkAmount * (Double(tipPercentage)/100)
    }
    
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
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section{
                    Text(tipAmmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Tip")
                }
                
                Section{
                    Text(totalPlusTip, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Total + Tip")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Amount per Person")
                }
                
                Section{
                    Button(action: {
                        saveData.append(totalPlusTip)
                        writeData(saveData)
                    }) {
                        HStack {
                            Spacer()
                            Text("Save Total")
                            Spacer()
                        }
                    }
                    NavigationLink("Past Totals", destination: HistoryView(saveData: $saveData))
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
