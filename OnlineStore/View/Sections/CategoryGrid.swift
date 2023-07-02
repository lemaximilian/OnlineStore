//
//  CategoryGrid.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct CategoryGrid: View {
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
            ForEach(placeholderVM.placeholder) { placeholder in
                NavigationLink(destination: CategoryPage()) {
                    ProductRound(title: placeholder.title)
                }
                .buttonStyle(.plain)
            }
        }
    }
}


