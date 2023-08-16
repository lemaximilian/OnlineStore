//
//  Checkout.swift
//  OnlineStore
//
//  Created by Maximilian Le on 26.07.23.
//

import SwiftUI

struct Checkout: View {
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var productVM: ProductViewModel
    @EnvironmentObject var notificationVM: NotificationViewModel
    @State var fullName = ""
    @State var address = ""
    @State var postcode: Int32 = 0
    @State var city = ""
    @State var checkedShipping = true
    @State var checkedPayment = true
    @Binding var showPopover: Bool
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                CheckoutItemList(products: Array(userVM.currentUser.shoppingCart))
                
                InvoiceFields(checkedShipping: $checkedShipping, total: checkedShipping ? productVM.calcTotal(products: Array(userVM.currentUser.shoppingCart)) : productVM.calcTotal(products: Array(userVM.currentUser.shoppingCart)) + 4.99)
                
                ShippingInformationFields(fullName: $fullName, address: $address, postcode: $postcode, city: $city)
            
                ShippingOptions(checkedShipping: $checkedShipping)
                
                PaymentOptions(checkedPayment: $checkedPayment)
            
                PurchaseButton(
                    showPopover: $showPopover,
                    total: checkedShipping ? productVM.calcTotal(products: Array(userVM.currentUser.shoppingCart)) : productVM.calcTotal(products: Array(userVM.currentUser.shoppingCart)) + 4.99,
                    fullName: fullName,
                    address: address,
                    postcode: postcode,
                    city: city,
                    shipping: checkedShipping ? "Standard" : "Express",
                    payment: checkedPayment ? "PayPal" : "Credit Card",
                    purchaseDate: Date()
                )
                
            }
            .navigationTitle("Checkout")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        notificationVM.unsubscribeNotification()
                        showPopover = false
                    }
                }
            }
        }
    }
}

