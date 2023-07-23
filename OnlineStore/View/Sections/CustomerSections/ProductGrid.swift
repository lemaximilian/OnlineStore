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
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
            ForEach(productVM.products) { product in
                NavigationLink(destination: ProductPage(currentProduct: product, imageArray: productVM.fetchProductImages(product: product, viewContext: viewContext))) {
                    ProductRectangle(title: product.title, image: productVM.fetchProductImages(product: product, viewContext: viewContext).first)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

