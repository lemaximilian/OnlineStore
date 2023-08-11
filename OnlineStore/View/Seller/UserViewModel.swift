//
//  UserViewModel.swift
//  OnlineStore
//
//  Created by Maximilian Le on 29.06.23.
//

import SwiftUI
import CoreData

class UserViewModel: ObservableObject {
    let controller = PersistenceController.shared
    @Published var users: [User] = []
    @Published var currentUser = User()
    
    func fetchUsers(viewContext: NSManagedObjectContext) {
        let request = NSFetchRequest<User>(entityName: "User")
        
        do {
            users = try viewContext.fetch(request)
        } catch let error {
            print("Error while fetching. \(error.localizedDescription)")
        }
    }
    
    func addUser(
        mail: String,
        username: String,
        password: String,
        birthDate: Date,
        isSeller: Bool,
        viewContext: NSManagedObjectContext
    ) -> Validation {
        if mail.isEmpty || username.isEmpty || password.isEmpty {
            return .fieldsInvalid
        } else {
            
            let user = User(context: viewContext)
            user.id = UUID()
            user.mail = mail
            user.username = username
            user.password = password
            user.birthDate = birthDate
            user.isSeller = isSeller
            
            let reviews: [Review] = []
            user.review = Set(reviews)
            
            save(viewContext: viewContext)
            currentUser = user
            
            if isSeller {
                return .successSeller
            } else {
                return .successCustomer
            }
        }
    }
    
    func validateUser(
        username: String,
        password: String
    ) -> Validation {
        if username.isEmpty || password.isEmpty {
            return .fieldsInvalid
        } else {
            if let user = users.first(where: { $0.username == username && $0.password == password }) {
                currentUser = user
                
                if user.isSeller == false {
                    return .successCustomer
                } else {
                    return .successSeller
                }
            }
            return .credentialsInvalid
        }
    }
    
    func save(viewContext: NSManagedObjectContext) {
        users.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.controller.save(viewContext: viewContext)
            self.fetchUsers(viewContext: viewContext)
        }
    }
}
