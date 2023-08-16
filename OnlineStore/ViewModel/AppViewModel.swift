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
    
    var numberFormatterDecimal: NumberFormatter {
        appData.numberFormatterDecimal
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
    
    func loginAsCustomer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                self.appData.loginAsCustomer()
                self.appData.stopLoading()
            }
        }
    }
    
    func loginAsSeller() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                self.appData.loginAsSeller()
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


