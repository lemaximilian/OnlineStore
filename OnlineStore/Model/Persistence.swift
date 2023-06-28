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
        
        let address = Bundle.main.path(forResource: "OnlineStore", ofType: ".momd")
        
        let localStoreLocation = URL(fileURLWithPath: "\(address!)/local.sqlite")
        let localStoreDescription = NSPersistentStoreDescription(url: localStoreLocation)
        localStoreDescription.configuration = "Local"
        
        let publicStoreLocation = URL(fileURLWithPath: "\(address!)/public.sqlite")
        let publicStoreDescription = NSPersistentStoreDescription(url: publicStoreLocation)
        publicStoreDescription.configuration = "Public"
        publicStoreDescription.cloudKitContainerOptions = NSPersistentCloudKitContainerOptions(containerIdentifier: "iCloud.THKoeln.OnlineStore")
        publicStoreDescription.cloudKitContainerOptions?.databaseScope = .public
        
        container.persistentStoreDescriptions = [
            publicStoreDescription,
            localStoreDescription
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
    ) -> Bool {
        if mail.isEmpty || username.isEmpty || password.isEmpty {
            return false
        } else {
            let user = User(context: viewContext)
            user.id = UUID()
            user.mail = mail
            user.username = username
            user.password = password
            user.birthdate = birthdate
            user.isSeller = isSeller
            save(viewContext: viewContext)
            return true
        }
    }
    
    func removeUser(users: FetchedResults<User>, viewContext: NSManagedObjectContext) {
        users.forEach(viewContext.delete)
        save(viewContext: viewContext)
    }
    
    func validateUser(username: String, password: String) -> Bool {
        if username.isEmpty || password.isEmpty {
            return false
        } else {
            return true
//            let user = User(context: viewContext)
//            user.id = UUID()
//            user.mail = mail
//            user.username = username
//            user.password = password
//            user.birthdate = birthdate
//            user.isSeller = isSeller
//            do {
//                try viewContext.save()
//            } catch {
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
        }
    }

}
