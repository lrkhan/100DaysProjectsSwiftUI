//
//  HistoryView.swift
//  WeSplit
//
//  Created by Luthfor Khan on 12/3/21.
//

import SwiftUI

struct HistoryView: View {
    var saveData: [Double] = []
    
    var body: some View {
        Form{
            Section{
                ForEach(0..<saveData.count){i in
                    Text(saveData[i], format: .currency(code: Locale.current.currencyCode ?? "USD") )
                }
            }
        }
        .navigationTitle("Saved Data")
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        let saveDataTemp: [Double] = [2.5, 1.0, 55.4]
        
        HistoryView(saveData: saveDataTemp)
    }
}
