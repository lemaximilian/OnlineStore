//
//  ProductToolbar.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct ProductToolbar: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var productVM: ProductViewModel
    @Binding var showAlert: Bool
    var currentProduct: Product

    var body: some View {
        HStack {
            Button {
//                var shoppingCart: [Product] = []
//                shoppingCart.append(currentProduct)
                userVM.currentUser.shoppingCart.insert(currentProduct)
                productVM.save(viewContext: viewContext)
                userVM.save(viewContext: viewContext)
                showAlert = true
            } label: {
                HStack {
                    Image(systemName: "cart")
                    Text("Add to Shopping Cart")
                }
            }
            .buttonStyle(.borderedProminent)
            .padding(.top)
            .alert("Added to Shopping Cart", isPresented: $showAlert) {
                        Button("OK", role: .cancel) { }
            }
            
            Button {
                // Set as favourite
            } label: {
                Image(systemName: "heart")
            }
            .buttonStyle(.borderedProminent)
            .padding(.top)
        }
    }
}

