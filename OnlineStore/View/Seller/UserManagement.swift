//
//  EditUser.swift
//  OnlineStore
//
//  Created by Maximilian Le on 12.08.23.
//

import SwiftUI

struct UserManagement: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var userVM: UserViewModel
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "isSeller == %@", "false")) private var users: FetchedResults<User>
    
    var body: some View {
        if users.isEmpty {
            Text("There are currently no users")
                .navigationTitle("User Management")
        } else {
            List {
                ForEach(users) { user in
                    NavigationLink(destination: EditUser(user: user)) {
                        Text(user.username ?? "Unknown Username")
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
}

