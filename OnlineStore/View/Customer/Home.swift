//
//  Home.swift
//  OnlineStore
//
//  Created by Maximilian Le on 31.05.23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            TopProducts(title: "Top Products")
            
            Divider()
            
            CategoriesWithTitle(title: "Categories")
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.large)
        .padding()
    }
}

