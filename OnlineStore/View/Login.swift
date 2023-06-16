//
//  Login.swift
//  OnlineStore
//
//  Created by Maximilian Le on 15.06.23.
//

import SwiftUI

struct Login: View {
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                // Title
                Text("Login")
                    .font(.title)
                    .bold()
                
                // User Inputs
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                // Button to Register
                
                NavigationLink(destination: Management()) {
                    Text("Login")
                }
                .buttonStyle(.borderedProminent)
                .padding()
                
                Spacer()
                
                // Button to Login
                HStack {
                    Spacer()
                    Button("No account? Register here!") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    .padding()
                }
            }
            .navigationBarBackButtonHidden(true)
            .padding()
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login().environmentObject(PlaceholderViewModel())
    }
}
