//
//  AppViewModel.swift
//  OnlineStore
//
//  Created by Maximilian Le on 27.06.23.
//

import SwiftUI

class AppViewModel: ObservableObject {
    @Published private var appData = AppData()
    
    var alertShown: Bool {
        get { appData.alertShown }
        set { appData.alertShown = newValue }
    }
    
    var isLoading: Bool {
        get { appData.isLoading }
        set { appData.isLoading = newValue }
    }
    
    var isLoggedIn: Bool {
        get { appData.isLoggedIn }
        set { appData.isLoggedIn = newValue }
    }
    
    func login() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            withAnimation {
                self.appData.login()
            }
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


