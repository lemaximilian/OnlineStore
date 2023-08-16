//
//  AddCategory.swift
//  OnlineStore
//
//  Created by Maximilian Le on 03.07.23.
//

import SwiftUI
import PhotosUI

struct AddCategory: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var appVM: AppViewModel
    @EnvironmentObject var categoryVM: CategoryViewModel
    @State private var title: String = ""
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            TextField("Title", text: $title)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            AddCategoryPhoto(selectedItem: $selectedItem, selectedImageData: $selectedImageData)
            
            AddCategoryButton(title: title, selectedImageData: selectedImageData)
        }
        .navigationTitle("New Category")
        .padding()
    }
}

