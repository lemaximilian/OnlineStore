//
//  ProductPage.swift
//  OnlineStore
//
//  Created by Maximilian Le on 14.06.23.
//

import SwiftUI

struct ProductPage: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var productVM: ProductViewModel
    @State var selection = ""
    @State var showAlert = false
    var currentProduct: Product
    var imageArray: [Data]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
    
            ProductImages(imageArray: imageArray)
            
            PriceText(price: currentProduct.price)
            
            Divider()
            
            ProductDescription(description: currentProduct.details)
            
            Divider()
            
            ProductHighlights(highlightArray: productVM.fetchProductHighlights(product: currentProduct, viewContext: viewContext))
            
            ProductReviews()
            
        }
        .navigationTitle(currentProduct.title ?? "")
        .padding(.horizontal)
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                ProductToolbar(showAlert: $showAlert, currentProduct: currentProduct)
            }
        }
    }
}
