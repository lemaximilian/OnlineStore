//
//  ProductImages.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct ProductImages: View {
    var imageArray: [Data]
    
    var body: some View {
        TabView {
            ForEach(imageArray, id: \.self) { image in
                if let uiImage = UIImage(data: image) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 250, height: 250)
                }
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .frame(minHeight: 475)
    }
}

