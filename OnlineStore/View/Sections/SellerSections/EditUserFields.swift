//
//  EditUserFields.swift
//  OnlineStore
//
//  Created by Maximilian Le on 16.08.23.
//

import SwiftUI

struct EditUserFields: View {
    @Binding var mail: String
    @Binding var username: String
    @Binding var password: String
    @Binding var birthdate: Date
    
    var body: some View {
        Text("E-Mail Address")
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        TextField("E-Mail Address", text: $mail)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
        
        Text("Username")
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        TextField("Username", text: $username)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
        
        Text("Password")
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        TextField("Password", text: $password)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
        
        DatePicker("Enter Birthdate:", selection: $birthdate, displayedComponents: .date)
            .padding()
    }
}

