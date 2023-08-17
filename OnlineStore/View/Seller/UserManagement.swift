//
//  UserManagement.swift
//  OnlineStore
//
//  Created by Maximilian Le on 12.08.23.
//

import SwiftUI

struct UserManagement: View {
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "isSeller == %@", "0")) private var users: FetchedResults<User>
    
    var body: some View {
        if users.isEmpty {
            EmptyUser()
                .navigationTitle("User Management")
        } else {
            UserManagementList()
        }
    }
}

