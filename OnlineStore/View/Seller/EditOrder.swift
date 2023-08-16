//
//  EditOrder.swift
//  OnlineStore
//
//  Created by Maximilian Le on 14.08.23.
//

import SwiftUI

struct EditOrder: View {
    @EnvironmentObject var orderVM: OrderViewModel
    @State var order: Order
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            CheckoutItemList(products: Array(order.products))
            
            InvoiceFields(checkedShipping: orderVM.getShippingBool(order: order), total: order.total)
            
            if order.isShipped {
                ShippingInformation(order: order)
            } else {
                ShippingInformationFields(
                    fullName: $order.unwrappedFullName,
                    address: $order.unwrappedAddress,
                    postcode: $order.postcode,
                    city: $order.unwrappedCity
                )
            }
            
            ShippingChoice(order: order)
            
            PaymentChoice(order: order)
            
            Divider()
                .padding(.horizontal)
            
            ShippingStatus(order: order)
            
            if !(order.isShipped) {
                EditOrderButton(
                    fullName: $order.unwrappedFullName,
                    address: $order.unwrappedAddress,
                    postcode: $order.postcode,
                    city: $order.unwrappedCity,
                    order: order
                )
            }
        }
    }
}


