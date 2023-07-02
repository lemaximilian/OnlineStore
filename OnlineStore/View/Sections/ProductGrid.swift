//
//  ProductGrid.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct ProductGrid: View {
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
            ForEach(placeholderVM.placeholder) { product in
                NavigationLink(destination: ProductPage(currentPlaceholder: product)) {
                    ProductRectangle(title: product.title)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

