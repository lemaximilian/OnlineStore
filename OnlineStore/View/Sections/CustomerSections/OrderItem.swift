//
//  OrderItem.swift
//  OnlineStore
//
//  Created by Maximilian Le on 04.08.23.
//

import SwiftUI

struct OrderItem: View {
    @EnvironmentObject var orderVM: OrderViewModel
    var order: Order
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            CheckoutItemList(products: Array(order.products))
            
            InvoiceFields(checkedShipping: orderVM.getShippingBool(order: order), total: order.total)
            
            ShippingInformation(order: order)
            
            ShippingChoice(order: order)
            
            PaymentChoice(order: order)
        }
    }
}

