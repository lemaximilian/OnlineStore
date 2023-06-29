//
//  AppData.swift
//  OnlineStore
//
//  Created by Maximilian Le on 27.06.23.
//

import Foundation

struct AppData {
    var alertShown = false
    var invalidFields = false
    var isLoading = false
    var isLoggedIn: LoginState = .notLoggedIn
    
    mutating func loginCustomer() {
        isLoggedIn = .loggedInCustomer
        isLoading = false
    }
    
    mutating func loginSeller() {
        isLoggedIn = .loggedInSeller
        isLoading = false
    }
    
    mutating func logout() {
        isLoggedIn = .notLoggedIn
        isLoading = false
    }
}
