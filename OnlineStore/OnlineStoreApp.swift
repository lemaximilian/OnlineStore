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
    @StateObject private var order = OrderViewModel()
    @StateObject private var review = ReviewViewModel()
    @StateObject private var notification = NotificationViewModel()
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
                .environmentObject(order)
                .environmentObject(review)
                .environmentObject(notification)
        }
    }
}
