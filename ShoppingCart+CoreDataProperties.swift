//
//  ShoppingCart+CoreDataProperties.swift
//  OnlineStore
//
//  Created by Maximilian Le on 06.07.23.
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
    @NSManaged public var product: NSSet?

}

// MARK: Generated accessors for product
extension ShoppingCart {

    @objc(addProductObject:)
    @NSManaged public func addToProduct(_ value: Product)

    @objc(removeProductObject:)
    @NSManaged public func removeFromProduct(_ value: Product)

    @objc(addProduct:)
    @NSManaged public func addToProduct(_ values: NSSet)

    @objc(removeProduct:)
    @NSManaged public func removeFromProduct(_ values: NSSet)

}

extension ShoppingCart : Identifiable {

}
