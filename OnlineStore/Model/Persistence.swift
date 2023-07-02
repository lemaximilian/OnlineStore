//
//  Persistence.swift
//  OnlineStore
//
//  Created by Maximilian Le on 25.05.23.
//

import SwiftUI
import CoreData
import CloudKit

class PersistenceController {
    static let shared = PersistenceController()
    let database = CKContainer.default().publicCloudDatabase

    static var preview: PersistenceController = {
            let result = PersistenceController(inMemory: true)
            let viewContext = result.container.viewContext
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            return result
        }()
    
    let container: NSPersistentCloudKitContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "OnlineStore")
        
//        let address = Bundle.main.path(forResource: "OnlineStore", ofType: ".momd")
//
//        let localStoreLocation = URL(fileURLWithPath: "/dev/null")
//        let localStoreDescription = NSPersistentStoreDescription(url: localStoreLocation)
//        localStoreDescription.configuration = "Local"
        
        let publicStoreLocation = URL(fileURLWithPath: "/dev/null")
        let publicStoreDescription = NSPersistentStoreDescription(url: publicStoreLocation)
        publicStoreDescription.configuration = "Public"
        publicStoreDescription.cloudKitContainerOptions = NSPersistentCloudKitContainerOptions(containerIdentifier: "iCloud.THKoeln.OnlineStore")
        publicStoreDescription.cloudKitContainerOptions?.databaseScope = .public
        
        container.persistentStoreDescriptions = [
            publicStoreDescription
//            localStoreDescription
        ]
        
//        guard let description = container.persistentStoreDescriptions.first else {
//            fatalError("Error")
//        }
//
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
//        persistentContainer.loadPersistentStores { storeDescription, error in
//            guard error == nil else {
//                fatalError("Could not load persistent stores. \(error!)")
//            }
//        }
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func save(viewContext: NSManagedObjectContext) {
            do {
                try viewContext.save()
                print("Data has been saved successfully.")
            } catch {
                // Handle errors in our database
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    
    func addUser(
        mail: String,
        username: String,
        password: String,
        birthdate: Date,
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
            user.birthdate = birthdate
            user.isSeller = isSeller
            save(viewContext: viewContext)
            
            if isSeller {
                return .successSeller
            } else {
                return .successCustomer
            }
        }
    }
    
    func removeUser(users: FetchedResults<User>, viewContext: NSManagedObjectContext) {
        users.forEach(viewContext.delete)
        save(viewContext: viewContext)
    }
    
    func validateUser(users: FetchedResults<User>, username: String, password: String) -> Validation {
        if username.isEmpty || password.isEmpty {
            return .fieldsInvalid
        } else {
            if let user = users.first(where: { $0.username == username && $0.password == password }) {
                if user.isSeller == false {
                    return .successCustomer
                } else {
                    return .successSeller
                }
            }
            return .credentialsInvalid
        }
    }
    
    func fetchUser(users: FetchedResults<User>, username: String, password: String) -> User {
        var user = User()
        user = users.first(where: { $0.username == username && $0.password == password }) ?? User()
        return user
    }

}
