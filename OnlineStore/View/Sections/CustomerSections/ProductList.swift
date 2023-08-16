//
//  ProductList.swift
//  OnlineStore
//
//  Created by Maximilian Le on 13.08.23.
//

import SwiftUI

struct ProductList: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var productVM: ProductViewModel
    @State private var searchText = ""
    
    var body: some View {
        if productVM.products.isEmpty {
            EmptyProduct()
        } else {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                    ForEach(searchResults) { product in
                        NavigationLink(destination: ProductPage(currentProduct: product, imageArray: productVM.fetchProductImages(product: product, viewContext: viewContext))) {
                            ProductRectangle(title: product.title, image: productVM.fetchProductImages(product: product, viewContext: viewContext).first)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search products...")
        }
    }
    
    var searchResults: [Product] {
        if searchText.isEmpty {
            return productVM.products.map { $0 }
        } else {
            return productVM.products.map { $0 }.filter { $0.title?.localizedCaseInsensitiveContains(searchText) ?? false }
        }
    }
}

