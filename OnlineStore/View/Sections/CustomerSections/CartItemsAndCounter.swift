//
//  CartItemsAndCounter.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct CartItemsAndCounter: View {
    @EnvironmentObject var userVM: UserViewModel
    @State var showAlert = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack {
                Text("\(userVM.currentUser.shoppingCart.count) Products")
                Spacer()
            }
            .padding(.horizontal)
            
            ForEach(Array(userVM.currentUser.shoppingCart)) { product in
                ShoppingCartItem(product: product)
                Divider()
            }
        }
        .navigationTitle("Shopping Cart")
        .padding()
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                PurchaseButton(showAlert: $showAlert)
            }
        }
    }
}


