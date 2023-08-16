//
//  CategoryPage.swift
//  OnlineStore
//
//  Created by Maximilian Le on 14.06.23.
//

import SwiftUI

struct CategoryPage: View {
    let category: Category
    
    var body: some View {
        ProductGrid(category: category)
            .navigationTitle(category.unwrappedTitle)
            .padding()
    }
}

