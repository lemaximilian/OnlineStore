//
//  OrderItem.swift
//  OnlineStore
//
//  Created by Maximilian Le on 04.08.23.
//

import SwiftUI

struct OrderItemsAndCounter: View {
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            OrderCounter(orderCount: userVM.currentUser.orders.count)
            
            OrderItemList()
        }
        .navigationTitle("Orders")
    }
}

