//
//  CartItemsAndCounter.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct CartItemsAndCounter: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var appVM: AppViewModel
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var productVM: ProductViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack {
                Text("\(userVM.currentUser.shoppingCart.count) Products")
                Spacer()
            }
            .padding(.horizontal)
            
            ForEach(Array(userVM.currentUser.shoppingCart)) { product in
                ShoppingCartItem(product: product, image: productVM.fetchProductImages(product: product, viewContext: viewContext).first ?? Data())
                Divider()
            }
            
            HStack {
                Spacer()
                Text("Total: \(appVM.formatter.string(from: NSNumber(value: calcTotalAmount())) ?? "")€")
                    .font(.title)
                    .bold()
            }
        }
        .navigationTitle("Shopping Cart")
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                PurchaseButton()
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


