//
//  EditUserButton.swift
//  OnlineStore
//
//  Created by Maximilian Le on 13.08.23.
//

import SwiftUI

struct EditUserButton: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var appVM: AppViewModel
    @EnvironmentObject var userVM: UserViewModel
    @Binding var mail: String
    @Binding var username: String
    @Binding var password: String
    @Binding var birthDate: Date
    var user: User
    
    var body: some View {
        Button("Edit User") {
            editUser()
        }
        .alert(isPresented: $appVM.alertShown) {
            MissingAlert
        }
        .buttonStyle(.borderedProminent)
        .padding()
    }
    
    var MissingAlert: Alert {
        Alert(
            title: Text("Missing Inputs"),
            message: Text("Please check your inputs"),
            dismissButton: .default(Text("Confirm"))
        )
    }
    
    func editUser() {
        if mail.isEmpty || username.isEmpty || password.isEmpty {
            appVM.alertShown = true
        } else {
            userVM.editUser(
                user: user,
                mail: mail,
                username: username,
                password: password,
                birthDate: birthDate,
                viewContext: viewContext
            )
        }
    }
}
