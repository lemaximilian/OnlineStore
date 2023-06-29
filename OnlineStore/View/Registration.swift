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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @FetchRequest(sortDescriptors: []) private var users: FetchedResults<User>
    
    @State private var mail = ""
    @State private var username = ""
    @State private var birthdate = Date()
    @State private var password = ""
    @State private var isSeller = false
    
    var body: some View {
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
                switch PersistenceController.shared.addUser(
                    mail: mail,
                    username: username,
                    password: password,
                    birthdate: birthdate,
                    isSeller: isSeller,
                    viewContext: viewContext
                ) {
                case .fieldsInvalid: appVM.alertShown.toggle()
                case .credentialsInvalid:
                    print("Oops, something went wrong.")
                case .successCustomer:
                    withAnimation {
                        appVM.isLoading = true
                    }
                    appVM.loginCustomer()
                case .successSeller:
                    withAnimation {
                        appVM.isLoading = true
                    }
                    appVM.loginSeller()
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
                Button("Login with an existing account") {
                    self.presentationMode.wrappedValue.dismiss()
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
        .disabled(appVM.isLoading)
        .blur(radius: appVM.isLoading ? 3 : 0)
        .overlay(LoadingOverlay(isLoading: $appVM.isLoading, title: "Loading"))
        .padding()
    }
        
}

struct Registration_Previews: PreviewProvider {
    static var previews: some View {
        Registration()
            .environmentObject(PlaceholderViewModel())
            .environmentObject(AppViewModel())
    }
}
