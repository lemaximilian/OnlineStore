//
//  Login.swift
//  OnlineStore
//
//  Created by Maximilian Le on 15.06.23.
//

import SwiftUI
import CoreData

struct Login: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    @EnvironmentObject var appVM: AppViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @FetchRequest(sortDescriptors: []) private var users: FetchedResults<User>
    
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
                
                // Button to Login
                
//                NavigationLink(destination: Management()) {
//                    Text("Login")
//                }
//                .buttonStyle(.borderedProminent)
//                .padding()
                
                Button("Login") {
                    if PersistenceController.shared.validateUser(username: username, password: password) {
                        appVM.login()
                    } else {
                        appVM.alertShown = true
                    }
                }
                .alert(Text("Missing inputs"), isPresented: $appVM.alertShown, actions: {
                    Button("Confirm") { }
                }, message: {
                    Text("Please enter an username or password.")
                })
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
        Login()
            .environmentObject(PlaceholderViewModel())
            .environmentObject(AppViewModel())
    }
}
