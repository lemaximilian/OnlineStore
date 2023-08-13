//
//  EditProductButton.swift
//  OnlineStore
//
//  Created by Maximilian Le on 12.08.23.
//

import SwiftUI

struct EditProductButton: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var appVM: AppViewModel
    @EnvironmentObject var productVM: ProductViewModel
    var title: String
    var price: Float
    var description: String
    var selectedCategory: Category
    var highlightArray: [String]
    var imageArray: [Data?]
    var product: Product
    
    var body: some View {
        Button("Edit Product") {
            editProduct()
        }
        .alert(isPresented: $appVM.alertShown) {
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
    
    func editProduct() {
        if title.isEmpty || description.isEmpty || highlightArray.isEmpty || imageArray.isEmpty {
            appVM.alertShown = true
        } else {
            productVM.editProduct(
                product: product,
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


