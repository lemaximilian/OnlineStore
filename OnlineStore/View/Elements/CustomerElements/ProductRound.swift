//
//  ProductRound.swift
//  OnlineStore
//
//  Created by Maximilian Le on 05.06.23.
//

import SwiftUI

struct ProductRound: View {
    var title: String?
    var image: Data?
    
    var body: some View {
        VStack {
            if let image,
               let uiImage = UIImage(data: image) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .cornerRadius(20)
                    .shadow(radius: 5)
            }
            Text(title ?? "")
                .font(.footnote)
        }
        .padding()
    }
}

