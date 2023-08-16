//
//  TabController.swift
//  OnlineStore
//
//  Created by Maximilian Le on 31.05.23.
//

import SwiftUI

struct TabController: View {
    @State private var tab: Tab = .home
    
    var body: some View {
        TabView(selection: $tab) {
            HomeTab()
            ShoppingCartTab()
            ProductsTab()
            CategoriesTab()
            SettingsTab()
        }
    }
}

