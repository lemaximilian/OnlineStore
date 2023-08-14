//
//  RegisterButton.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct RegisterButton: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var appVM: AppViewModel
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var productVM: ProductViewModel
    @Binding var mail: String
    @Binding var username: String
    @Binding var birthDate: Date
    @Binding var password: String
    @Binding var isSeller: Bool
    
    var body: some View {
        Button("Register") {
            register()
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
            message: Text("Please enter an email or username or password."),
            dismissButton: .default(Text("Confirm"))
        )
    }
    
    func register() {
        userVM.fetchUsers(viewContext: viewContext)
        switch userVM.addUser(
            mail: mail,
            username: username,
            password: password,
            birthDate: birthDate,
            isSeller: isSeller,
            viewContext: viewContext
        ) {
        case .fieldsInvalid: appVM.alertShown.toggle()
        case .credentialsInvalid:
            print("Oops, something went wrong.")
        case .successCustomer:
            appVM.invalidFields = false
            appVM.loading()
            productVM.fetchProducts(viewContext: viewContext)
            appVM.loginCustomer()
        case .successSeller:
            appVM.invalidFields = false
            appVM.loading()
            productVM.fetchProducts(viewContext: viewContext)
            appVM.loginSeller()
        }
    }
}
