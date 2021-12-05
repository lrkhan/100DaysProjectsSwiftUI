//
//  HistoryView.swift
//  WeSplit
//
//  Created by Luthfor Khan on 12/3/21.
//

import SwiftUI

struct HistoryView: View {
    @Binding var saveData: [Double]
    
    var body: some View {
        Form{
            Section{
                Button(action: {
                    saveData.removeAll()
                    writeData(saveData)
                }) {
                    HStack{
                        Spacer()
                        Text("Clear All")
                            .foregroundColor(Color.red)
                        Spacer()
                    }
                }
            }
            
            Section{
                if !saveData.isEmpty{
                    ForEach(0..<saveData.count){i in
                        Text(saveData[i], format: .currency(code: Locale.current.currencyCode ?? "USD") )
                    }
                } else {
                    VStack {
                        HStack {
                            Spacer()
                            Text("Nothing to See Here")
                                .padding(/*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
                            Spacer()
                        }
                        Spacer()
                        Text(flandersQuote[Int.random(in: 0..<flandersQuote.count)])
                            .multilineTextAlignment(.center)
                        HStack {
                            Spacer()
                            Text("- Ned Flanders")
                        }
                    }
                }
            }
        }
        .navigationTitle("Saved Data")
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        let tempData: [Double] = []
        
        HistoryView(saveData: .constant(tempData))
    }
}
