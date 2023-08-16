//
//  OrderManagement.swift
//  OnlineStore
//
//  Created by Maximilian Le on 14.08.23.
//

import SwiftUI

struct OrderManagement: View {
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        if userVM.users.isEmpty {
            EmptyUser()
                .navigationTitle("Order Management")
        } else {
            OrderManagementUserList()
        }
    }
}

