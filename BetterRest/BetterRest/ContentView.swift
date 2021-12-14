//
//  ContentView.swift
//  BetterRest
//
//  Created by Luthfor Khan on 12/9/21.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var wakeUp = defaultDate
    
    static var defaultDate: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    init(){
        calculateBedtime()
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    
                    HStack {
                        Spacer()
                        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                        Spacer()
                    }
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Daily amount of coffee")
                        .font(.headline)
                    
                    Picker("Coffee", selection: $coffeeAmount){
                        ForEach((1...20), id: \.self){number in
                            Text("\(number) of cups")
                        }
                    }
                }
                
                Section {
                    
                    Text(alertTitle)
                        .font(.headline)
                        
                    
                    HStack {
                        Spacer()
                        Text(alertMessage)
                        Spacer()
                    }
                    
                    
                }
            }
            .navigationTitle("BetterRest")
            .onAppear(perform: calculateBedtime)
            
        }
    }
    
    func calculateBedtime(){
        do {
            let config = MLModelConfiguration()
            
            let model = try SleepCalculator(configuration: config)
            
            let comonents = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (comonents.hour ?? 0) * 60 * 60
            let min = (comonents.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + min), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your Ideal Bedtime is:"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "There was an error Calculating your bedtimel"
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
