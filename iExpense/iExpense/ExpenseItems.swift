//
//  ExpenseItems.swift
//  iExpense
//
//  Created by Luthfor Khan on 12/20/21.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem](){
        didSet{
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items){
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init () {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems){
                items = decodedItems
                return
            }
        }
        items = []
    }
    
    func getBusiness() -> [ExpenseItem] {
        var business: [ExpenseItem] = []
        
        for item in items {
            if item.type == "Business"{
                business.append(item)
            }
        }
        
        return business
    }
    
    func getPersonal() -> [ExpenseItem] {
        var personal: [ExpenseItem] = []
        
        for item in items {
            if item.type == "Personal"{
                personal.append(item)
            }
        }
        
        return personal
    }
}
