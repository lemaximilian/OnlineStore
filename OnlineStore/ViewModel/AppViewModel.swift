//
//  AppViewModel.swift
//  OnlineStore
//
//  Created by Maximilian Le on 27.06.23.
//

import SwiftUI

@MainActor
class AppViewModel: ObservableObject {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Published private var appData = AppData()
    
    var alertShown: Bool {
        get { appData.alertShown }
        set { appData.alertShown = newValue }
    }
    
    var invalidFields: Bool {
        get { appData.invalidFields }
        set { appData.invalidFields = newValue }
    }
    
    var isLoading: Bool {
        get { appData.isLoading }
        set { appData.isLoading = newValue }
    }
    
    var isLoggedIn: LoginState {
        get { appData.isLoggedIn }
        set { appData.isLoggedIn = newValue }
    }
    
    func loginCustomer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation {
                self.appData.loginCustomer()
            }
            self.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func loginSeller() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation {
                self.appData.loginSeller()
            }
            self.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func logout() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                self.appData.logout()
            }
        }
    }
}


