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
            ProductFields(
                title: $product.unwrappedTitle,
                price: $product.price,
                description: $product.unwrappedDetails
            )
            
            CategoryPicker(selectedCategory: $product.unwrappedCategory)
            
            HighlightList(highlightArray: getHighlights())
            
            ProductPhoto(imageArray: getImages())
            
            EditProductButton(
                title: $product.unwrappedTitle,
                price: $product.price,
                description: $product.unwrappedDetails,
                selectedCategory: $product.unwrappedCategory,
                highlightArray: getHighlights(),
                imageArray: getImages(),
                product: product
            )
        }
        .navigationTitle("Edit Product")
        .padding()
    }
    
    func getHighlights() -> Binding<[String]> {
        var highlightArray = productVM.fetchProductHighlights(product: product, viewContext: viewContext)
        return Binding(get: { highlightArray }, set: { highlightArray = $0 })
    }
    
    func getImages() -> Binding<[Data?]> {
        var imageArray: [Data?] = productVM.fetchProductImages(product: product, viewContext: viewContext)
        return Binding(get: { imageArray }, set: { imageArray = $0 })
    }
}

