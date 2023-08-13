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
                CheckoutItemList()
                
                InvoiceFields(checkedShipping: $checkedShipping, total: calcTotalAmount())
                
                ShippingInformation(fullName: $fullName, address: $address, postcode: $postcode, city: $city)
            
                ShippingOptions(checkedShipping: $checkedShipping)
                
                PaymentOptions(checkedPayment: $checkedPayment)
            
                PurchaseButton(
                    showPopover: $showPopover,
                    total: checkedShipping ? calcTotalAmount() : calcTotalAmount() + 4.99,
                    fullName: fullName,
                    address: address,
                    postcode: postcode,
                    city: city,
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
                        notificationVM.unsubscribeNotification()
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

