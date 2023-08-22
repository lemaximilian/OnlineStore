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
    
    // track currently user logged in
    @Published var currentUser = User(context: PersistenceController.shared.container.viewContext)
    
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
    
    func editUser(
        user: User,
        mail: String,
        username: String,
        password: String,
        birthDate: Date,
        viewContext: NSManagedObjectContext
    ) {
        user.mail = mail
        user.username = username
        user.password = password
        user.birthDate = birthDate
        save(viewContext: viewContext)
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
    
    func removeUser(at offsets: IndexSet, users: FetchedResults<User>, viewContext: NSManagedObjectContext) {
        for index in offsets {
            let user = users[index]
            viewContext.delete(user)
        }
        save(viewContext: viewContext)
    }
    
    func addProductToShoppingCart(product: Product, viewContext: NSManagedObjectContext) {
        currentUser.shoppingCart.insert(product)
        save(viewContext: viewContext)
    }
    
    func save(viewContext: NSManagedObjectContext) {
        users.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.controller.save(viewContext: viewContext)
            self.fetchUsers(viewContext: viewContext)
        }
    }
}
