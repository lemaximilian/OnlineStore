//
//  OrderManagement.swift
//  OnlineStore
//
//  Created by Maximilian Le on 14.08.23.
//

import SwiftUI

struct OrderManagement: View {
    @EnvironmentObject var userVM: UserViewModel
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "isSeller == %@", "false")) private var users: FetchedResults<User>
    
    var body: some View {
        if userVM.users.isEmpty {
            Text("There are currently no users.")
                .navigationTitle("Order Management")
        } else {
            List {
                ForEach(users) { user in
                    NavigationLink(destination: UserOrderList(user: user)) {
                        Text(user.username ?? "Unknown Username")
                    }
                }
            }
            .navigationTitle("Order Management")
        }
    }
}

