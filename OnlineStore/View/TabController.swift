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
        NavigationStack {
            TabView(selection: $tab) {
                
                Home()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .tag(Tab.home)
                
                ShoppingCart()
                    .tabItem {
                        Image(systemName: "cart")
                        Text("Shopping Cart")
                    }
                    .tag(Tab.shoppingCart)
                
                Categories()
                    .tabItem {
                        Image(systemName: "rectangle.grid.2x2")
                        Text("Categories")
                    }
                    .tag(Tab.categories)
                
                Settings()
                    .tabItem {
                        Image(systemName: "gearshape")
                        Text("Settings")
                    }
                    .tag(Tab.settings)
                
                
            }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabController()
            .environmentObject(PlaceholderViewModel())
    }
}
