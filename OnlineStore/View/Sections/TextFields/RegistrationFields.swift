//
//  RegistrationFields.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct RegistrationFields: View {
    @Binding var mail: String
    @Binding var username: String
    @Binding var birthdate: Date
    @Binding var password: String
    @Binding var isSeller: Bool
    
    var body: some View {
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
    }
}

