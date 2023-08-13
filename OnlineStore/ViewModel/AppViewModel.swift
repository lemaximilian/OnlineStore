//
//  AppViewModel.swift
//  OnlineStore
//
//  Created by Maximilian Le on 27.06.23.
//

import SwiftUI

@MainActor
class AppViewModel: ObservableObject {
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
    
    var numberFormatter: NumberFormatter {
        appData.numberFormatter
    }
    
    var numberFormatterInt: NumberFormatter {
        appData.numberFormatterInt
    }
    
    var dateFormatter: DateFormatter {
        appData.dateFormatter
    }
    
    func loading() {
        withAnimation {
            self.appData.loading()
        }
    }
    
    func loginCustomer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                self.appData.loginCustomer()
                self.appData.stopLoading()
            }
        }
    }
    
    func loginSeller() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                self.appData.loginSeller()
                self.appData.stopLoading()
            }
        }
    }
    
    func logout() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                self.appData.logout()
                self.appData.stopLoading()
            }
        }
    }
}


