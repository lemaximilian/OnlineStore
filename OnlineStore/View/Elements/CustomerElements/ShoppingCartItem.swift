//
//  ShoppingCartItem.swift
//  OnlineStore
//
//  Created by Maximilian Le on 05.06.23.
//

import SwiftUI

struct ShoppingCartItem: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var appVM: AppViewModel
    @EnvironmentObject var userVM: UserViewModel
    var product: Product
    var image: Data
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill()
                .foregroundColor(.white)
                .aspectRatio(contentMode: .fit)
                .shadow(radius: 5)
                .padding()
            
            VStack {
                HStack {
                    Text(product.title ?? "Unknown Product")
                        .font(.title)
                        .bold()
                    Spacer()
                    Button(role: .destructive, action: {
                        withAnimation {
                            userVM.currentUser.shoppingCart.remove(product)
                            userVM.save(viewContext: viewContext)
                        }
                    }) {
                        Image(systemName: "trash")
                    }
                }
                .padding()
                
                // Image Placeholder
                if let uiImage = UIImage(data: image) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .cornerRadius(20)
                        .padding(.horizontal)
                }
                
                HStack {
                    Spacer()
                    Text("Price: \(appVM.formatter.string(from: NSNumber(value: product.price)) ?? "")€")
                        .font(.title2)
                        .bold()
                }
                .padding()

            }
            .padding()
        }
    }
}

