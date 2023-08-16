//
//  AddProductButton.swift
//  OnlineStore
//
//  Created by Maximilian Le on 06.07.23.
//

import SwiftUI

struct AddProductButton: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var appVM: AppViewModel
    @EnvironmentObject var productVM: ProductViewModel
    @State var showAlert = false
    var title: String
    var price: Float
    var description: String
    var selectedCategory: Category
    var highlightArray: [String]
    var imageArray: [Data?]
    
    var body: some View {
        Button("Add Product") {
            addProduct()
        }
        .alert(isPresented: $showAlert) {
            MissingAlert
        }
        .buttonStyle(.borderedProminent)
        .padding()
    }
    
    var MissingAlert: Alert {
        Alert(
            title: Text("Missing Inputs"),
            message: Text("Please check your inputs"),
            dismissButton: .default(Text("Confirm"))
        )
    }
    
    func addProduct() {
        if title.isEmpty || description.isEmpty || highlightArray.isEmpty || imageArray.isEmpty {
            showAlert = true
        } else {
            productVM.addProduct(
                title: title,
                price: price,
                details: description,
                category: selectedCategory,
                highlights: highlightArray,
                images: imageArray,
                viewContext: viewContext
            )
        }
    }
}

