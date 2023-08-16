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
    @EnvironmentObject var productVM: ProductViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ProductCounter(productCount: userVM.currentUser.shoppingCart.count)
            
            ShoppingCartItemList()
            
            ShoppingCartTotal(totalString: appVM.numberFormatterDecimal.string(from: NSNumber(value: productVM.calcTotal(products: Array(userVM.currentUser.shoppingCart)))) ?? "")
        }
        .navigationTitle("Shopping Cart")
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                CheckoutButton()
            }
        }
    }
}


