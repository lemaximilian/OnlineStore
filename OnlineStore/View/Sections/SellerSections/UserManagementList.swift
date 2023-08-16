//
//  UserManagementList.swift
//  OnlineStore
//
//  Created by Maximilian Le on 16.08.23.
//

import SwiftUI

struct UserManagementList: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var userVM: UserViewModel
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "isSeller == %@", "0")) private var users: FetchedResults<User>
    
    var body: some View {
        List {
            ForEach(users) { user in
                NavigationLink(destination: EditUser(user: user)) {
                    Text(user.unwrappedUsername)
                }
            }
            .onDelete(perform: { indexSet in
                userVM.removeUser(at: indexSet, users: users, viewContext: viewContext)
            })
        }
        .navigationTitle("User Management")
        .toolbar {
            EditButton()
        }
    }
}

