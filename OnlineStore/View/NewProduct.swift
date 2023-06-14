//
//  NewProduct.swift
//  OnlineStore
//
//  Created by Maximilian Le on 11.06.23.
//

import SwiftUI
import PhotosUI

struct NewProduct: View {
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    @State private var title = ""
    @State private var description = ""
    @State private var selectedCategory = Placeholder(id: UUID(), title: "")
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    var body: some View {
        VStack {
            
//            HStack {
//                Text("New Product")
//                    .font(.largeTitle)
//                    .bold()
//                Spacer()
//            }
//            .padding()
            
            ScrollView(showsIndicators: false) {
                TextField("Title", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Description", text: $description, axis: .vertical)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Picker("Category", selection: $placeholderVM.placeholder.first ?? $selectedCategory) {
                    ForEach(placeholderVM.placeholder, id: \.self) { category in
                        Text(category.title)
                    }
                }
                .pickerStyle(.navigationLink)
                .padding()
                
                List {
                    Section("Highlights") {
                        ForEach(placeholderVM.placeholder) { highlight in
                            Text(highlight.title)
                        }
                    }
                }
                .listStyle(.plain)
                .frame(minHeight: 200)
                
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
            }
            
        }
        .navigationTitle("New Product")
        .padding()
    }
}

struct NewProduct_Previews: PreviewProvider {
    static var previews: some View {
        NewProduct().environmentObject(PlaceholderViewModel())
    }
}
