//
//  ShoppingCartItem.swift
//  OnlineStore
//
//  Created by Maximilian Le on 05.06.23.
//

import SwiftUI

struct ShoppingCartItem: View {
    var product: Product
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill()
                .foregroundColor(.blue)
                .aspectRatio(contentMode: .fit)
                .shadow(radius: 5)
            
            VStack {
                HStack {
                    Text(product.title ?? "Unknown Product")
                        .font(.title)
                        .bold()
                    Spacer()
                    Image(systemName: "heart")
                }
                .padding()
                
                // Image Placeholder
                ZStack {
                    Rectangle()
                        .fill()
                        .foregroundColor(.white)
                    Image(systemName: "photo")
                }
                .padding(.horizontal)
                
                HStack {
                    Spacer()
                    Text("Price: \(product.price)")
                        .font(.title2)
                        .bold()
                }
                .padding()

            }
        }
    }
}

