//
//  Registration.swift
//  OnlineStore
//
//  Created by Maximilian Le on 30.05.23.
//

import SwiftUI
import CoreData

struct Registration: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    @EnvironmentObject var appVM: AppViewModel
    @FetchRequest(sortDescriptors: []) private var users: FetchedResults<User>
    
    @State private var mail = ""
    @State private var username = ""
    @State private var birthdate = Date()
    @State private var password = ""
    @State private var isSeller = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                Group {
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
                
                // Button to Register
                
//                NavigationLink(destination: TabController()) {
//                    Text("Register")
//                }
//                .buttonStyle(.borderedProminent)
//                .padding()
                Button("Register") {
                    if PersistenceController.shared.addUser(
                        mail: mail,
                        username: username,
                        password: password,
                        birthdate: birthdate,
                        isSeller: isSeller,
                        viewContext: viewContext
                    ) {
                        withAnimation {
                            appVM.isLoading = true
                        }
                        appVM.login()
                    } else {
                        appVM.alertShown = true
                    }
                }
                .alert(Text("Missing inputs"), isPresented: $appVM.alertShown, actions: {
                    Button("Confirm") { }
                }, message: {
                    Text("Please enter an email or username or password.")
                })
                .buttonStyle(.borderedProminent)
                .padding()
                
                Button("Delete all Users", role: .destructive) {
                    PersistenceController.shared.removeUser(users: users, viewContext: viewContext)
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
        .disabled(appVM.isLoading)
        .blur(radius: appVM.isLoading ? 3 : 0)
        .overlay(LoadingOverlay(isLoading: $appVM.isLoading))
    }
}

struct Registration_Previews: PreviewProvider {
    static var previews: some View {
        Registration()
            .environmentObject(PlaceholderViewModel())
            .environmentObject(AppViewModel())
    }
}
