//
//  LoginButton.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct LoginButton: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var appVM: AppViewModel
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var productVM: ProductViewModel
    @EnvironmentObject var categoryVM: CategoryViewModel
    @EnvironmentObject var notificationVM: NotificationViewModel
    @State var showAlert = false
    var username: String
    var password: String
    @Binding var startAnimation: Bool
    
    var body: some View {
        Button("Login") {
            login()
        }
        .alert(Text("Missing Inputs"), isPresented: $showAlert, actions: {
            Button("Confirm") { }
        }, message: {
            Text("Please enter an username or password.")
        })
        .buttonStyle(.borderedProminent)
        .padding()
    }
    
    func login() {
        userVM.fetchUsers(viewContext: viewContext)
        switch userVM.validateUser(
            username: username,
            password: password
        ) {
        case .fieldsInvalid:
            appVM.invalidFields = false
            showAlert = true
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
            productVM.fetchProducts(viewContext: viewContext)
            categoryVM.fetchCategories(viewContext: viewContext)
            notificationVM.subscribeNotifications()
            appVM.loginAsCustomer()
        case .successSeller:
            appVM.invalidFields = false
            appVM.loading()
            productVM.fetchProducts(viewContext: viewContext)
            categoryVM.fetchCategories(viewContext: viewContext)
            appVM.loginAsSeller()
        }
    }
}

