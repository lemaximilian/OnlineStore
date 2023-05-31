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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(placeholder)
        }
    }
}
