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
            EditUserFields(
                mail: $user.unwrappedMail,
                username: $user.unwrappedUsername,
                password: $user.unwrappedPassword,
                birthdate: $user.unwrappedBirthDate
            )
            
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


