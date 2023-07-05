//
//  ProductPhoto.swift
//  OnlineStore
//
//  Created by Maximilian Le on 04.07.23.
//

import SwiftUI
import PhotosUI

struct ProductPhoto: View {
    @Binding var selectedItem: PhotosPickerItem?
    @Binding var selectedImageData: Data?
    @Binding var imageArray: [Data?]
    
    var body: some View {
        PhotosPicker(
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()) {
                    HStack {
                        Text("Add Image")
                                                
                        Image(systemName: "photos")
                    }
                }
                .onChange(of: selectedItem) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            selectedImageData = data
                            imageArray.append(selectedImageData)
                        }
                    }
                }
                .padding()
        
        if !imageArray.isEmpty {
            ForEach(imageArray, id: \.self) { image in
                if let uiImage = UIImage(data: image ?? Data()) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                }
            }
        }
    }
}

