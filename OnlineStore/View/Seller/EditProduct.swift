//
//  EditProduct.swift
//  OnlineStore
//
//  Created by Maximilian Le on 12.08.23.
//

import SwiftUI

struct EditProduct: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var productVM: ProductViewModel
    @State var product: Product
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            AddProductFields(
                title: $product.unwrappedTitle,
                price: $product.price,
                description: $product.unwrappedDetails
            )
            
            CategoryPicker(selectedCategory: $product.unwrappedCategory)
            
            HighlightList(highlightArray: productVM.getHighlightsBinding(product: product, viewContext: viewContext))
            
            AddProductPhoto(imageArray: productVM.getImagesBinding(product: product, viewContext: viewContext))
            
            EditProductButton(
                title: $product.unwrappedTitle,
                price: $product.price,
                description: $product.unwrappedDetails,
                selectedCategory: $product.unwrappedCategory,
                highlightArray: productVM.getHighlightsBinding(product: product, viewContext: viewContext),
                imageArray: productVM.getImagesBinding(product: product, viewContext: viewContext),
                product: product
            )
        }
        .navigationTitle("Edit Product")
        .padding()
    }
}

