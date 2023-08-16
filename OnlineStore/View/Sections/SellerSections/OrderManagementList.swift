//
//  OrderManagementList.swift
//  OnlineStore
//
//  Created by Maximilian Le on 14.08.23.
//

import SwiftUI

struct OrderManagementList: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var appVM: AppViewModel
    @EnvironmentObject var orderVM: OrderViewModel
    @FetchRequest(sortDescriptors: []) private var orders: FetchedResults<Order>
    var user: User
    
    var body: some View {
        if user.orders.isEmpty {
            Text("There are currently no orders placed.")
        } else {
            List {
                ForEach(Array(user.orders)) { order in
                    NavigationLink(destination: EditOrder(order: order)) {
                        Text("Order from \(appVM.dateFormatter.string(from: order.unwrappedPurchaseDate))")
                    }
                }
                .onDelete(perform: { indexSet in
                    orderVM.removeOrder(at: indexSet, orders: orders, viewContext: viewContext)
                })
            }
            .toolbar {
                EditButton()
            }
        }
    }
}

