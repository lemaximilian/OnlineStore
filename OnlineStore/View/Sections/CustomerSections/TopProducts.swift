//
//  TopProducts.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct TopProducts: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var productVM: ProductViewModel
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
        
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
            ForEach(productVM.products, id: \.self) { product in
                NavigationLink(destination: ProductPage(currentProduct: product, imageArray: productVM.fetchProductImages(product: product, viewContext: viewContext))) {
                    ProductRectangle(title: product.title, image: productVM.fetchProductImages(product: product, viewContext: viewContext).first)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

