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
    let database = CKContainer(identifier: "iCloud.THKoeln.Store").publicCloudDatabase

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
        let publicStoreLocation = URL(fileURLWithPath: "/dev/null")
        let publicStoreDescription = NSPersistentStoreDescription(url: publicStoreLocation)
        publicStoreDescription.configuration = "Public"
        publicStoreDescription.cloudKitContainerOptions = NSPersistentCloudKitContainerOptions(containerIdentifier: "iCloud.THKoeln.Store")
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
    
    // Category
    func addCategory(
        title: String,
        image: Data?,
        viewContext: NSManagedObjectContext
    ) {
        let category = Category(context: viewContext)
        category.id = UUID()
        category.title = title
        category.image = image
        let products: [Product] = []
        category.product = Set(products)
        save(viewContext: viewContext)
    }
}
