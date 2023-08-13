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
            // Top products section
            TopProducts(title: "Top Products")
            
            Divider()
            
            // Top categories section
            CategoriesWithTitle(title: "Categories")
            
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.large)
        .padding()
    }
}

