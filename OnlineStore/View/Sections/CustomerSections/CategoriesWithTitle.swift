//
//  CategoriesWithTitle.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct CategoriesWithTitle: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\.order)]) private var categories: FetchedResults<Category>
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
        
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

