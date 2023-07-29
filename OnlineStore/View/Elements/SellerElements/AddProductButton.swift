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
    @Binding var title: String
    @Binding var price: Float
    @Binding var description: String
    @Binding var selectedCategory: Category
    @Binding var highlightArray: [String]
    @Binding var imageArray: [Data?]
    
    var body: some View {
        Button("Add Product") {
            addProduct()
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
    
    func addProduct() {
        if title.isEmpty || description.isEmpty || highlightArray.isEmpty || imageArray.isEmpty {
            appVM.alertShown = true
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

