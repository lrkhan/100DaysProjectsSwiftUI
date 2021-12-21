//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Luthfor Khan on 12/20/21.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
