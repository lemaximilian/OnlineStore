//
//  CartItemsAndCounter.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct CartItemsAndCounter: View {
    @EnvironmentObject var appVM: AppViewModel
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ProductCounter(productCount: userVM.currentUser.shoppingCart.count)
            
            ShoppingCartItemList()
            
            ShoppingCartTotal(totalString: appVM.numberFormatter.string(from: NSNumber(value: calcTotalAmount())) ?? "")
        }
        .navigationTitle("Shopping Cart")
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                CheckoutButton()
            }
        }
    }
    
    func calcTotalAmount() -> Float {
        var total: Float = 0.0
        for product in userVM.currentUser.shoppingCart {
            total += product.price
        }
        return total
    }
}


