//
//  Data.swift
//  WeSplit
//
//  Created by Luthfor Khan on 12/3/21.
//

import Foundation


func saveData(totals: [Double]) -> Void {
    let encoder = JSONEncoder()
    
    let data = try! encoder.encode(totals)
    
    print(data)
}

func getData() -> [Double] {
    
    
    return []
}
