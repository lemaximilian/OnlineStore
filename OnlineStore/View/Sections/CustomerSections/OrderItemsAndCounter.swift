//
//  OrderItem.swift
//  OnlineStore
//
//  Created by Maximilian Le on 04.08.23.
//

import SwiftUI

struct OrderItemsAndCounter: View {
    @EnvironmentObject var appVM: AppViewModel
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack {
                Text("\(userVM.currentUser.orders.count) Orders")
                Spacer()
            }
            .padding(.horizontal)
            
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
        .navigationTitle("Orders")
    }
}

