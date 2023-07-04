//
//  TabController.swift
//  OnlineStore
//
//  Created by Maximilian Le on 31.05.23.
//

import SwiftUI

struct TabController: View {
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    @State private var tab: Tab = .home
    
    var body: some View {
        TabView(selection: $tab) {
            HomeTab()
            ShoppingCartTab()
            CategoriesTab()
            SettingsTab()
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabController()
            .environmentObject(PlaceholderViewModel())
    }
}