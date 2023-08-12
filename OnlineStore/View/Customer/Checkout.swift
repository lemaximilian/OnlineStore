//
//  Checkout.swift
//  OnlineStore
//
//  Created by Maximilian Le on 26.07.23.
//

import SwiftUI

struct Checkout: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var appVM: AppViewModel
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var productVM: ProductViewModel
    @State var checkedShipping = true
    @State var checkedPayment = true
    @Binding var showPopover: Bool
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                CheckoutItemList()
                
                InvoiceFields(checkedShipping: $checkedShipping, total: calcTotalAmount())
            
                ShippingOptions(checkedShipping: $checkedShipping)
                
                PaymentOptions(checkedPayment: $checkedPayment)
            
                PurchaseButton(
                    showPopover: $showPopover,
                    total: checkedShipping ? calcTotalAmount() : calcTotalAmount() + 4.99,
                    shipping: checkedShipping ? "Standard" : "Express",
                    payment: checkedPayment ? "PayPal" : "Credit Card",
                    purchaseDate: Date(),
                    user: userVM.currentUser,
                    products: Array(userVM.currentUser.shoppingCart)
                )
                
            }
            .navigationTitle("Checkout")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        showPopover = false
                    }
                }
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

