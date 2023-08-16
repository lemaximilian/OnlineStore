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
    @Binding var showAlert: Bool
    var currentProduct: Product

    var body: some View {
        HStack {
            Button {
                userVM.addProductToShoppingCart(product: currentProduct, viewContext: viewContext)
                showAlert = true
            } label: {
                HStack {
                    Image(systemName: "cart")
                    Text("Add to Shopping Cart")
                }
            }
            .buttonStyle(.borderedProminent)
            .padding(.vertical)
            .alert("Added to Shopping Cart", isPresented: $showAlert) {
                        Button("OK", role: .cancel) { }
            }
        }
    }
}

