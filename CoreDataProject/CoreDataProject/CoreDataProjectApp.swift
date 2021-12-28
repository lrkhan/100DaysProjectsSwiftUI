//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Luthfor Khan on 12/28/21.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
