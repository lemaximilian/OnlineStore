//
//  Registration.swift
//  OnlineStore
//
//  Created by Maximilian Le on 30.05.23.
//

import SwiftUI

struct Registration: View {
    @EnvironmentObject var appVM: AppViewModel
    @State private var mail = ""
    @State private var username = ""
    @State private var birthDate = Date()
    @State private var password = ""
    @State private var isSeller = false
    
    var body: some View {
        VStack {
            
            Spacer()
            
            // User Input
            RegistrationFields(mail: $mail, username: $username, birthDate: $birthDate, password: $password, isSeller: $isSeller)
        
            RegisterButton(mail: mail, username: username, birthDate: birthDate, password: password, isSeller: isSeller)
            
            Spacer()
            
            ExistingAccountButton()
            
        }
        .navigationBarBackButtonHidden(true)
        // modifiers for loading overlay
        .disabled(appVM.isLoading)
        .blur(radius: appVM.isLoading ? 3 : 0)
        .overlay(LoadingOverlay(isLoading: $appVM.isLoading, title: "Loading"))
        .padding()
        .transition(.move(edge: .trailing))
    }
}
