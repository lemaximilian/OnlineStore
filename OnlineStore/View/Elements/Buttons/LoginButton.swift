//
//  LoginButton.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct LoginButton: View {
    @EnvironmentObject var appVM: AppViewModel
    @EnvironmentObject var userVM: UserViewModel
    @FetchRequest(sortDescriptors: []) private var users: FetchedResults<User>
    @Binding var username: String
    @Binding var password: String
    @Binding var startAnimation: Bool
    
    var body: some View {
        Button("Login") {
            login()
        }
        .alert(Text("Missing Inputs"), isPresented: $appVM.alertShown, actions: {
            Button("Confirm") { }
        }, message: {
            Text("Please enter an username or password.")
        })
        .buttonStyle(.borderedProminent)
        .padding()
    }
    
    func login() {
        switch PersistenceController.shared.validateUser(
            users: users,
            username: username,
            password: password
        ) {
        case .fieldsInvalid:
            appVM.invalidFields = false
            appVM.alertShown.toggle()
        case .credentialsInvalid:
            appVM.invalidFields = true
            startAnimation = true
            withAnimation(.spring(
                response: 0.2,
                dampingFraction: 0.2,
                blendDuration: 0.2
            )) {
                startAnimation = false
            }
        case .successCustomer:
            appVM.invalidFields = false
            appVM.loading()
            userVM.user = PersistenceController.shared.fetchUser(
                users: users,
                username: username,
                password: password
            )
            appVM.loginCustomer()
        case .successSeller:
            appVM.invalidFields = false
            appVM.loading()
            userVM.user = PersistenceController.shared.fetchUser(
                users: users,
                username: username,
                password: password
            )
            appVM.loginSeller()
        }
    }
}


