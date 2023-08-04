//
//  ShoppingCartTab.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct ShoppingCartTab: View {
    var body: some View {
        NavigationStack {
            ShoppingCartPicker()
        }
        .tabItem {
            Image(systemName: "cart")
            Text("Shopping Cart")
        }
        .tag(Tab.shoppingCart)
    }
}

