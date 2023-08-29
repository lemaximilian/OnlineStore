//
//  CategoryGrid.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct CategoryGrid: View {
    @EnvironmentObject var categoryVM: CategoryViewModel
    @State private var searchText = ""
    
    var body: some View {
        if categoryVM.categories.isEmpty {
            EmptyCategory()
        } else {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                    ForEach(searchResults) { category in
                        NavigationLink(destination: CategoryPage(category: category)) {
                            ProductRound(title: category.title, image: category.image)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search categories...")
        }
    }
    
    var searchResults: [Category] {
        if searchText.isEmpty {
            return categoryVM.categories.map { $0 }
        } else {
            return categoryVM.categories.map { $0 }.filter { $0.title?.localizedCaseInsensitiveContains(searchText) ?? false }
        }
    }
}


