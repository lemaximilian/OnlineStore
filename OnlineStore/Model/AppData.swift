//
//  AppData.swift
//  OnlineStore
//
//  Created by Maximilian Le on 27.06.23.
//

import Foundation

struct AppData {
    var alertShown = false
    var isLoading = false
    var isLoggedIn = false
    
    mutating func login() {
        isLoggedIn = true
    }
    
    mutating func logout() {
        isLoggedIn = false
    }
}
