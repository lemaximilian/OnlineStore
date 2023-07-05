//
//  ProductGrid.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct ProductGrid: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\.title)]) private var products: FetchedResults<Product>
    @State var imageArray: [Data] = []
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
            ForEach(products) { product in
                NavigationLink(destination: ProductPage(currentProduct: product, imageArray: PersistenceController.shared.fetchProductImages(product: product))) {
                    ProductRectangle(title: product.title, image: PersistenceController.shared.fetchProductImages(product: product).first)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

