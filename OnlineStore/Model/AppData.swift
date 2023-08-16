//
//  AppData.swift
//  OnlineStore
//
//  Created by Maximilian Le on 27.06.23.
//

import Foundation
import SwiftUI

struct AppData {
    // Wrong User Credentials
    var invalidFields = false
    
    // Show Loading Overlay
    var isLoading = false
    
    // Current Login State
    var isLoggedIn: LoginState = .notLoggedIn
    
    let numberFormatterDecimal: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.decimalSeparator = ","
        formatter.groupingSeparator = ""
        formatter.zeroSymbol = ""
        return formatter
    }()
    
    let numberFormatterInt: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumIntegerDigits = 5
        formatter.groupingSeparator = ""
        formatter.zeroSymbol = ""
        return formatter
    }()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    mutating func loading() {
        isLoading = true
    }
    
    mutating func stopLoading() {
        isLoading = false
    }
    
    mutating func loginAsCustomer() {
        isLoggedIn = .loggedInAsCustomer
    }
    
    mutating func loginAsSeller() {
        isLoggedIn = .loggedInAsSeller
    }
    
    mutating func logout() {
        isLoggedIn = .notLoggedIn
    }
}
