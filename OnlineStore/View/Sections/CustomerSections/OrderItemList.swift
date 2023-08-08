//
//  OrderItemList.swift
//  OnlineStore
//
//  Created by Maximilian Le on 08.08.23.
//

import SwiftUI

struct OrderItemList: View {
    @EnvironmentObject var appVM: AppViewModel
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        ForEach(Array(userVM.currentUser.orders)) { order in
            NavigationLink(destination: OrderItem(order: order)) {
                HStack {
                    Text("Order from \(appVM.dateFormatter.string(from: order.purchaseDate ?? Date()))")
                    Spacer()
                }
                .padding()
            }
            Divider()
        }
    }
}

