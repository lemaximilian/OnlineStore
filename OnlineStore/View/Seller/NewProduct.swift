//
//  NewProduct.swift
//  OnlineStore
//
//  Created by Maximilian Le on 11.06.23.
//

import SwiftUI
import PhotosUI

struct NewProduct: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var appVM: AppViewModel
    @State private var title = ""
    @State private var price: Float = 0.0
    @State private var description = ""
    @State private var selectedCategoryName = "Smartphones"
    @State private var selectedCategory = Category()
    @State private var highlightArray: [String] = []
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    @State private var imageArray: [Data?] = []
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ProductFields(title: $title, price: $price, description: $description)
            
            CategoryPicker(selectedCategoryName: $selectedCategoryName, selectedCategory: $selectedCategory)
            
            HighlightList(highlightArray: $highlightArray)
            
            ProductPhoto(selectedItem: $selectedItem, selectedImageData: $selectedImageData, imageArray: $imageArray)
            
            Button("Add Product") {
                PersistenceController.shared.addProduct(
                    title: title,
                    price: price,
                    details: description,
                    category: selectedCategory,
                    highlight: highlightArray,
                    image: imageArray,
                    viewContext: viewContext
                )
            }
            .alert(isPresented: $appVM.alertShown) {
                MissingAlert
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .navigationTitle("New Product")
        .padding()
    }
    
    var MissingAlert: Alert {
        Alert(
            title: Text("Missing Inputs"),
            message: Text("Please check your inputs"),
            dismissButton: .default(Text("Confirm"))
        )
    }
}

struct NewProduct_Previews: PreviewProvider {
    static var previews: some View {
        NewProduct()
            .environmentObject(AppViewModel())
    }
}
