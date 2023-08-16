//
//  ShoppingCartContent.swift
//  OnlineStore
//
//  Created by Maximilian Le on 31.05.23.
//

import SwiftUI

struct ShoppingCartContent: View {
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        if userVM.currentUser.shoppingCart.isEmpty {
            EmptyCart()
        } else {
            CartItemsAndCounter()
        }
    }
}

