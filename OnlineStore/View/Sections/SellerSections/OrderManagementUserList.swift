//
//  OrderManagementUserList.swift
//  OnlineStore
//
//  Created by Maximilian Le on 16.08.23.
//

import SwiftUI

struct OrderManagementUserList: View {
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "isSeller == %@", "false")) private var users: FetchedResults<User>
    
    var body: some View {
        List {
            ForEach(users) { user in
                NavigationLink(destination: OrderManagementList(user: user)) {
                    Text(user.unwrappedUsername)
                }
            }
        }
        .navigationTitle("Order Management")
    }
}

