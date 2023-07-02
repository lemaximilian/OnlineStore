//
//  CartItemsAndCounter.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct CartItemsAndCounter: View {
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    @State var showAlert = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack {
                Text("\(placeholderVM.shoppingCart.count) Products")
                Spacer()
            }
            .padding(.horizontal)
            
            ForEach(placeholderVM.shoppingCart) { placeholder in
                ShoppingCartItem(title: placeholder.title)
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


