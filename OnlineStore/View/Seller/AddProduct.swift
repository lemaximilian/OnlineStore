//
//  AddProduct.swift
//  OnlineStore
//
//  Created by Maximilian Le on 11.06.23.
//

import SwiftUI
import PhotosUI

struct AddProduct: View {
    @State private var title = ""
    @State private var price: Float = 0.0
    @State private var description = ""
    @State var selectedCategory: Category
    @State private var highlightArray: [String] = []
    @State private var imageArray: [Data?] = []
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            AddProductFields(
                title: $title,
                price: $price,
                description: $description
            )
            
            CategoryPicker(selectedCategory: $selectedCategory)
            
            HighlightList(highlightArray: $highlightArray)
            
            AddProductPhoto(imageArray: $imageArray)
            
            AddProductButton(
                title: title,
                price: price,
                description: description,
                selectedCategory: selectedCategory,
                highlightArray: highlightArray,
                imageArray: imageArray
            )
        }
        .navigationTitle("New Product")
        .padding()
    }
}

