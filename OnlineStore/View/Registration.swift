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
    @State private var birthdate = Date()
    @State private var password = ""
    @State private var isSeller = false
    
    var body: some View {
        VStack {
            
            Spacer()
            
            // User Input
            RegistrationFields(mail: $mail, username: $username, birthdate: $birthdate, password: $password, isSeller: $isSeller)
        
            // Button to Register
            RegisterButton(mail: $mail, username: $username, birthdate: $birthdate, password: $password, isSeller: $isSeller)
            
            // Button to delete all Users (testing purposes)
            DeleteUsersButton()
            
            Spacer()
            
            // Button to Login View
            ExistingAccountButton()
            
        }
        .navigationBarBackButtonHidden(true)
        .disabled(appVM.isLoading)
        .blur(radius: appVM.isLoading ? 3 : 0)
        .overlay(LoadingOverlay(isLoading: $appVM.isLoading, title: "Loading"))
        .padding()
    }
}

struct Registration_Previews: PreviewProvider {
    static var previews: some View {
        Registration()
            .environmentObject(AppViewModel())
    }
}
