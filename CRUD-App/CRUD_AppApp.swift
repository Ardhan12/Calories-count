//
//  CRUD_AppApp.swift
//  CRUD-App
//
//  Created by Arief Ramadhan on 19/01/23.
//

import SwiftUI

@main
struct CRUD_AppApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
            
        }
    }
}
