//
//  ProductPage.swift
//  OnlineStore
//
//  Created by Maximilian Le on 14.06.23.
//

import SwiftUI

struct ProductPage: View {
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    @State var selection = ""
    @State var showAlert = false
    var currentPlaceholder: Placeholder
    
    var body: some View {
        ScrollView(showsIndicators: false) {
    
            ProductImages()
            
            PriceText()
            
            Divider()
            
            ProductDescription()
            
            Divider()
            
            ProductHighlights()
            
            ProductReviews()
            
        }
        .navigationTitle(currentPlaceholder.title)
        .padding()
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                ProductToolbar(showAlert: $showAlert, currentPlaceholder: currentPlaceholder)
            }
        }
    }
}
