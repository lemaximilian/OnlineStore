//
//  Login.swift
//  OnlineStore
//
//  Created by Maximilian Le on 15.06.23.
//

import SwiftUI

struct Login: View {
    @EnvironmentObject var appVM: AppViewModel
    @EnvironmentObject var notificationVM: NotificationViewModel
    @State private var username = ""
    @State private var password = ""
    @State private var startAnimation = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                // User Input
                LoginFields(username: $username, password: $password, startAnimation: $startAnimation)
                
                // Button to Login
                LoginButton(username: $username, password: $password, startAnimation: $startAnimation)
                
                Spacer()
                
                // Button to Registration View
                NoAccountButton()
                
            }
            .disabled(appVM.isLoading)
            .blur(radius: appVM.isLoading ? 3 : 0)
            .overlay(LoadingOverlay(isLoading: $appVM.isLoading, title: "Loading"))
            .padding()
            .transition(.move(edge: .trailing))
        }
        .onAppear {
            notificationVM.requestPermissions()
        }
    }
}

