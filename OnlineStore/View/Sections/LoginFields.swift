//
//  LoginFields.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct LoginFields: View {
    @EnvironmentObject var appVM: AppViewModel
    @Binding var username: String
    @Binding var password: String
    @Binding var startAnimation: Bool
    
    var body: some View {
        // Title
        Text("Login")
            .font(.title)
            .bold()
        
        // User Inputs
        TextField("Username", text: $username)
            .textFieldStyle(.roundedBorder)
            .padding()
        
        SecureField("Password", text: $password)
            .textFieldStyle(.roundedBorder)
            .padding()
        
        if appVM.invalidFields {
            Text("User Credentials doesn't match. Please check again.")
                .font(.footnote)
                .foregroundColor(.red)
                .offset(x: startAnimation ? 30 : 0)
                .padding()
        }
    }
}

