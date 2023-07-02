//
//  CategoriesTab.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct CategoriesTab: View {
    var body: some View {
        NavigationStack {
            Categories()
        }
        .tabItem {
            Image(systemName: "rectangle.grid.2x2")
            Text("Categories")
        }
        .tag(Tab.categories)
    }
}
