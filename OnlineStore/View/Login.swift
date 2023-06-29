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
    @FetchRequest(sortDescriptors: []) private var users: FetchedResults<User>
    
    @State private var username = ""
    @State private var password = ""
    @State private var startAnimation = false
    
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
                
                if appVM.invalidFields {
                    Text("User Credentials doesn't match. Please check again.")
                        .font(.footnote)
                        .foregroundColor(.red)
                        .offset(x: startAnimation ? 30 : 0)
                        .padding()
                }
                // Button to Login
                
    //                NavigationLink(destination: Management()) {
    //                    Text("Login")
    //                }
    //                .buttonStyle(.borderedProminent)
    //                .padding()
                
                Button("Login") {
    //                    if PersistenceController.shared.validateUser(
    //                        users: users,
    //                        username: username,
    //                        password: password
    //                    ) {
    //                        withAnimation {
    //                            appVM.isLoading.toggle()
    //                        }
    //                        appVM.login()
    //                    } else {
    //                        appVM.alertShown.toggle()
    //                    }
                    switch PersistenceController.shared.validateUser(
                        users: users,
                        username: username,
                        password: password
                    ) {
                    case .fieldsInvalid:
                        appVM.invalidFields = false
                        appVM.alertShown.toggle()
                    case .credentialsInvalid:
                        appVM.invalidFields = true
                        startAnimation = true
                        withAnimation(.spring(
                            response: 0.2,
                            dampingFraction: 0.2,
                            blendDuration: 0.2
                        )) {
                            startAnimation = false
                        }
                    case .successCustomer:
                        appVM.invalidFields = false
                        withAnimation {
                            appVM.isLoading.toggle()
                        }
                        appVM.loginCustomer()
                    case .successSeller:
                        appVM.invalidFields = false
                        withAnimation {
                            appVM.isLoading.toggle()
                        }
                        appVM.loginSeller()
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
                    NavigationLink(destination: Registration()) {
                        Text("No account? Register here!")
                    }
                    .padding()
                }
            }
            .disabled(appVM.isLoading)
            .blur(radius: appVM.isLoading ? 3 : 0)
            .overlay(LoadingOverlay(isLoading: $appVM.isLoading, title: "Loading"))
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
