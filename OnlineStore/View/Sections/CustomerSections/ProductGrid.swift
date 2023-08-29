//
//  ProductGrid.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct ProductGrid: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var productVM: ProductViewModel
    @State var imageArray: [Data] = []
    let category: Category
    
    var body: some View {
        if category.product.isEmpty {
            Text("There are no products in this category")
        } else {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                    ForEach(Array(category.product)) { product in
                        NavigationLink(destination: ProductPage(currentProduct: product, imageArray: productVM.fetchProductImages(product: product, viewContext: viewContext))) {
                            ProductRectangle(title: product.title, image: productVM.fetchProductImages(product: product, viewContext: viewContext).first)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }
}

