//
//  ProductsTab.swift
//  OnlineStore
//
//  Created by Maximilian Le on 13.08.23.
//

import SwiftUI

struct ProductsTab: View {
    var body: some View {
        NavigationStack {
            Products()
        }
        .tabItem {
            Image(systemName: "rectangle.3.group")
            Text("Products")
        }
        .tag(Tab.products)
    }
}

