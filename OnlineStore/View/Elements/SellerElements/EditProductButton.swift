//
//  EditProductButton.swift
//  OnlineStore
//
//  Created by Maximilian Le on 12.08.23.
//

import SwiftUI

struct EditProductButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var appVM: AppViewModel
    @EnvironmentObject var productVM: ProductViewModel
    @State var activeAlert: ActiveAlert = .first
    @Binding var title: String
    @Binding var price: Float
    @Binding var description: String
    @Binding var selectedCategory: Category
    @Binding var highlightArray: [String]
    @Binding var imageArray: [Data?]
    var product: Product
    
    var body: some View {
        Button("Edit Product") {
            editProduct()
        }
        .alert(isPresented: $appVM.alertShown) {
            switch activeAlert {
            case .first: return missingAlert
            case .second: return editAlert
            }
        }
        .buttonStyle(.borderedProminent)
        .padding()
    }
    
    var missingAlert: Alert {
        Alert(
            title: Text("Missing Inputs"),
            message: Text("Please check your inputs"),
            dismissButton: .default(Text("Confirm"))
        )
    }
    
    var editAlert: Alert {
        Alert(
            title: Text("Product edited!"),
            dismissButton: .cancel(Text("OK")) {
                self.presentationMode.wrappedValue.dismiss()
            }
        )
    }
    
    func editProduct() {
        if title.isEmpty || description.isEmpty || highlightArray.isEmpty || imageArray.isEmpty {
            activeAlert = .first
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
            activeAlert = .second
            appVM.alertShown = true
        }
    }
}


