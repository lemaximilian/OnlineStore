//
//  Orders.swift
//  OnlineStore
//
//  Created by Maximilian Le on 04.08.23.
//

import SwiftUI

struct Orders: View {
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        if userVM.currentUser.orders.isEmpty {
            EmptyOrder()
        } else {
            OrderItemsAndCounter()
        }
    }
}

