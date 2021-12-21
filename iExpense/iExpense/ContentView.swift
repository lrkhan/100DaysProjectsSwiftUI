//
//  ContentView.swift
//  iExpense
//
//  Created by Luthfor Khan on 12/20/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAddExpense = false
    @StateObject var expenses = Expenses()
    
    let currency = (Locale.current.currencyCode ?? "USD")
    
    var body: some View {
        let personal = expenses.getPersonal()
        let business = expenses.getBusiness()
        
        NavigationView {
            List {
                Section("Business"){
                    ForEach(business) { item in
                        HStack {
                            VStack(alignment: .leading){
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            Text(item.amount, format: .currency(code: currency))
                        }
                    }
                    .onDelete(perform: removeItems)
                    
                }
                
                Section("Personal"){
                    ForEach(personal) { item in
                        
                        HStack {
                            VStack(alignment: .leading){
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            Text(item.amount, format: .currency(code: currency))
                        }
                        
                    }
                    .onDelete(perform: removeItems)
                    
                }
            }
            .navigationTitle("iExpense")
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
