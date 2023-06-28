//
//  OnlineStoreApp.swift
//  OnlineStore
//
//  Created by Maximilian Le on 25.05.23.
//

import SwiftUI

@main
struct OnlineStoreApp: App {
    @StateObject private var placeholder = PlaceholderViewModel()
    @StateObject private var appData = AppViewModel()
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(placeholder)
                .environmentObject(appData)
        }
    }
}
