//
//  ProductPage.swift
//  OnlineStore
//
//  Created by Maximilian Le on 14.06.23.
//

import SwiftUI

struct ProductPage: View {
    @State var selection = ""
    @State var showAlert = false
    @State var highlightArray: [String] = []
    var currentProduct: Product
    var imageArray: [Data]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
    
            ProductImages(imageArray: imageArray)
//            if let image,
//               let uiImage = UIImage(data: image) {
//                Image(uiImage: uiImage)
//                    .resizable()
//                    .aspectRatio(1, contentMode: .fit)
//                    .cornerRadius(20)
//                    .shadow(radius: 5)
//            }
            
            PriceText(price: currentProduct.price)
            
            Divider()
            
            ProductDescription(description: currentProduct.details)
            
            Divider()
            
            ProductHighlights(highlightArray: highlightArray)
            
            ProductReviews()
            
        }
        .navigationTitle(currentProduct.title ?? "")
        .padding()
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                ProductToolbar(showAlert: $showAlert, currentProduct: currentProduct)
            }
        }
        .onAppear {
            do {
                if let loadedHighlights =  try NSKeyedUnarchiver.unarchivedObject(ofClass: NSArray.self, from: currentProduct.highlights ?? Data()) as? [String] {
                    highlightArray = loadedHighlights
                }
            } catch {
                print("Could not unarchive Highlight Array.")
            }
        }
    }
}
