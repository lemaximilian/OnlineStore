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
    // public CKContainer for push notifications
    let database = CKContainer(identifier: "iCloud.THKoeln.Store").publicCloudDatabase
    let container: NSPersistentCloudKitContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "OnlineStore")
        let publicStoreLocation = URL(fileURLWithPath: "/dev/null")
        let publicStoreDescription = NSPersistentStoreDescription(url: publicStoreLocation)
        publicStoreDescription.configuration = "Public"
        publicStoreDescription.cloudKitContainerOptions = NSPersistentCloudKitContainerOptions(containerIdentifier: "iCloud.THKoeln.Store")
        
        // public NSPersistentCloudKitContainer
        publicStoreDescription.cloudKitContainerOptions?.databaseScope = .public
        
        container.persistentStoreDescriptions = [
            publicStoreDescription
        ]

        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        do {
            try container.initializeCloudKitSchema()
        } catch let error {
            print(error)
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        // avoid duplicate records
        container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
    }
    
    func save(viewContext: NSManagedObjectContext) {
        do {
            try viewContext.save()
            print("Data has been saved successfully.")
        } catch {
            // Handle errors in database
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
