//
//  AppData.swift
//  OnlineStore
//
//  Created by Maximilian Le on 27.06.23.
//

import Foundation
import SwiftUI

struct AppData {
    // Missing Input(s) Alert
    var alertShown = false
    
    // Wrong User Credentials
    var invalidFields = false
    
    // Show Loading Overlay
    var isLoading = false
    
    // Current Login State
    var isLoggedIn: LoginState = .notLoggedIn
    
    mutating func loading() {
        isLoading = true
    }
    
    mutating func stopLoading() {
        isLoading = false
    }
    
    mutating func loginCustomer() {
        isLoggedIn = .loggedInCustomer
    }
    
    mutating func loginSeller() {
        isLoggedIn = .loggedInSeller
    }
    
    mutating func logout() {
        isLoggedIn = .notLoggedIn
    }
}
