//
//  EditUser.swift
//  OnlineStore
//
//  Created by Maximilian Le on 12.08.23.
//

import SwiftUI

struct EditUser: View {
    @State var user: User
    
    var body: some View {
        VStack {
            Text("E-Mail Address")
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            TextField("E-Mail Address", text: $user.unwrappedMail)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            Text("Username")
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            TextField("Username", text: $user.unwrappedUsername)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            Text("Password")
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            TextField("Password", text: $user.unwrappedPassword)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            DatePicker("Enter Birthdate:", selection: $user.unwrappedBirthDate, displayedComponents: .date)
                .padding()
            
            EditUserButton(
                mail: $user.unwrappedMail,
                username: $user.unwrappedUsername,
                password: $user.unwrappedPassword,
                birthDate: $user.unwrappedBirthDate,
                user: user
            )
        }
        .navigationTitle("Manage User")
        .padding(.horizontal)
    }
}


