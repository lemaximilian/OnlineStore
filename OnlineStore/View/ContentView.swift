//
//  ContentView.swift
//  OnlineStore
//
//  Created by Maximilian Le on 25.05.23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appVM: AppViewModel
    
    var body: some View {
        switch appVM.isLoggedIn {
        case .notLoggedIn:
            Login()
                .transition(.move(edge: .trailing))
        case .loggedInAsCustomer:
            TabController()
                .transition(.move(edge: .trailing))
        case .loggedInAsSeller:
            Management()
                .transition(.move(edge: .trailing))
        }
    }
}

