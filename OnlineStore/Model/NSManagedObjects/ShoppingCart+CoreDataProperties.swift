//
//  ShoppingCart+CoreDataProperties.swift
//  OnlineStore
//
//  Created by Maximilian Le on 04.07.23.
//
//

import Foundation
import CoreData


extension ShoppingCart {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ShoppingCart> {
        return NSFetchRequest<ShoppingCart>(entityName: "ShoppingCart")
    }
    
    @NSManaged public var id: UUID?
    @NSManaged public var user: User?

    public var wrappedId: UUID {
        id ?? UUID()
    }
    
    public var wrappedUser: User {
        user ?? User()
    }
}

extension ShoppingCart : Identifiable {

}
