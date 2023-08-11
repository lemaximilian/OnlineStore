//
//  CategoryGrid.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct CategoryGrid: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\.order)]) private var categories: FetchedResults<Category>
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                ForEach(categories) { category in
                    NavigationLink(destination: CategoryPage(category: category)) {
                        ProductRound(title: category.title, image: category.image)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}


