//
//  AddCategoryButton.swift
//  OnlineStore
//
//  Created by Maximilian Le on 16.08.23.
//

import SwiftUI

struct AddCategoryButton: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var appVM: AppViewModel
    @EnvironmentObject var categoryVM: CategoryViewModel
    @State var showAlert = false
    var title: String
    var selectedImageData: Data?
    
    var body: some View {
        Button("Add Category") {
            if selectedImageData != nil {
                categoryVM.addCategory(
                    title: title,
                    image: selectedImageData,
                    viewContext: viewContext
                )
            } else {
                showAlert = true
            }
        }
        .alert(isPresented: $showAlert) {
            MissingAlert
        }
        .buttonStyle(.borderedProminent)
        .padding()
    }
    
    var MissingAlert: Alert {
        Alert(
            title: Text("Missing Image"),
            message: Text("Please select an image."),
            dismissButton: .default(Text("Confirm"))
        )
    }
}

