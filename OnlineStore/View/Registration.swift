//
//  Registration.swift
//  OnlineStore
//
//  Created by Maximilian Le on 30.05.23.
//

import SwiftUI

struct Registration: View {
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    @State private var mail = ""
    @State private var username = ""
    @State private var birthdate = Date()
    @State private var password = ""
    @State private var isSeller = false
    
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                // Title
                Text("Registration")
                    .font(.title)
                    .bold()
                
                // User Inputs
                TextField("E-Mail Address", text: $mail)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                DatePicker("Enter your Birthdate:", selection: $birthdate, displayedComponents: .date)
                    .padding()
                
                Toggle("Seller Account", isOn: $isSeller)
                    .padding()
                
                // Button to Register
                
                NavigationLink(destination: TabController()) {
                    Text("Register")
                }
                .buttonStyle(.borderedProminent)
                .padding()
                
                Spacer()
                
                // Button to Login
                HStack {
                    Spacer()
                    NavigationLink(destination: Login()) {
                        Text("Login with an existing account")
                    }
                    .padding()
                }
            }
            .padding()
        }
    }
}

struct Registration_Previews: PreviewProvider {
    static var previews: some View {
        Registration().environmentObject(PlaceholderViewModel())
    }
}
