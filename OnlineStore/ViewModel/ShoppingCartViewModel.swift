//
//  ShoppingCartViewModel.swift
//  OnlineStore
//
//  Created by Maximilian Le on 06.07.23.
//

import SwiftUI

class ShoppingCartViewModel: ObservableObject {
    @Published private var shoppingCartVM = ShoppingCart()
    @Published private var productsVM: [Product] = []
    
    var shoppingCart: ShoppingCart {
        get { shoppingCartVM }
        set { shoppingCartVM = newValue }
    }
    
    var products: [Product] {
        get { productsVM }
        set { productsVM = newValue }
    }

}
