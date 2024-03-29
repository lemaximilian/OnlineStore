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
    @Binding var birthDate: Date
    @Binding var password: String
    @Binding var isSeller: Bool
    
    var body: some View {
        // Title
        HStack {
            Text("Registration")
                .font(.title)
                .bold()
            Image(systemName: "person.fill.badge.plus")
        }
            
        // User Inputs
        TextField("E-Mail Address", text: $mail)
            .textFieldStyle(.roundedBorder)
            .padding()
            
        TextField("Username", text: $username)
            .textFieldStyle(.roundedBorder)
            .padding()
            
        SecureField("Password", text: $password)
            .textFieldStyle(.roundedBorder)
            .padding()
            
        DatePicker("Enter your Birthdate:", selection: $birthDate, displayedComponents: .date)
            .padding()
            
        Toggle("Seller Account", isOn: $isSeller)
            .padding()
    }
}

