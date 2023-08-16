//
//  EditUserButton.swift
//  OnlineStore
//
//  Created by Maximilian Le on 13.08.23.
//

import SwiftUI

struct EditUserButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var appVM: AppViewModel
    @EnvironmentObject var userVM: UserViewModel
    @State var showAlert = false
    @State var activeAlert: ActiveAlert = .first
    @Binding var mail: String
    @Binding var username: String
    @Binding var password: String
    @Binding var birthDate: Date
    var user: User
    
    var body: some View {
        Button("Edit User") {
            editUser()
        }
        .alert(isPresented: $showAlert) {
            switch activeAlert {
            case .first: return missingAlert
            case .second: return editAlert
            }
        }
        .buttonStyle(.borderedProminent)
        .padding()
    }
    
    var missingAlert: Alert {
        Alert(
            title: Text("Missing Inputs"),
            message: Text("Please check your inputs"),
            dismissButton: .default(Text("Confirm"))
        )
    }
    
    var editAlert: Alert {
        Alert(
            title: Text("User edited!"),
            dismissButton: .cancel(Text("OK")) {
                self.presentationMode.wrappedValue.dismiss()
            }
        )
    }
    
    func editUser() {
        if mail.isEmpty || username.isEmpty || password.isEmpty {
            activeAlert = .first
            showAlert = true
        } else {
            userVM.editUser(
                user: user,
                mail: mail,
                username: username,
                password: password,
                birthDate: birthDate,
                viewContext: viewContext
            )
            activeAlert = .second
            showAlert = true
        }
    }
}
