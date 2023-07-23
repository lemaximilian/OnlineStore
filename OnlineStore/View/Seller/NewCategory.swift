//
//  NewCategory.swift
//  OnlineStore
//
//  Created by Maximilian Le on 03.07.23.
//

import SwiftUI
import PhotosUI

struct NewCategory: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var appVM: AppViewModel
    @State private var title: String = ""
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            TextField("Title", text: $title)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            PhotosPicker(
                    selection: $selectedItem,
                    matching: .images,
                    photoLibrary: .shared()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke()
                                .aspectRatio(contentMode: .fit)
                            
                            VStack {
                                Image(systemName: "plus")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                
                                Text("Add Image")
                                    .font(.footnote)
                                    .bold()
                            }
                        }
                    }
                    .onChange(of: selectedItem) { newItem in
                        Task {
                            if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                selectedImageData = data
                            }
                        }
                    }
            
            if let selectedImageData,
               let uiImage = UIImage(data: selectedImageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
            }
            
            Button("Add Category") {
                if selectedImageData != nil {
                    PersistenceController.shared.addCategory(
                        title: title,
                        image: selectedImageData,
                        viewContext: viewContext
                    )
                } else {
                    appVM.alertShown = true
                }
            }
            .alert(isPresented: $appVM.alertShown) {
                MissingAlert
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .navigationTitle("New Category")
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

