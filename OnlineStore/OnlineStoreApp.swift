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
    @StateObject private var user = UserViewModel()
    @StateObject private var product = ProductViewModel()
    let persistenceController = PersistenceController.shared
    
    init() {
        UILabel.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).adjustsFontSizeToFitWidth = true
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(placeholder)
                .environmentObject(appData)
                .environmentObject(user)
                .environmentObject(product)
        }
    }
}
