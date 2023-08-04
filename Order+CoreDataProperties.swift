//
//  Order+CoreDataProperties.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.08.23.
//
//

import Foundation
import CoreData


extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var payment: String?
    @NSManaged public var shipping: String?
    @NSManaged public var total: Float
    @NSManaged public var purchaseDate: Date?
    @NSManaged public var products: Set<Product>
    @NSManaged public var user: User?

}

// MARK: Generated accessors for products
extension Order {

    @objc(addProductsObject:)
    @NSManaged public func addToProducts(_ value: Product)

    @objc(removeProductsObject:)
    @NSManaged public func removeFromProducts(_ value: Product)

    @objc(addProducts:)
    @NSManaged public func addToProducts(_ values: NSSet)

    @objc(removeProducts:)
    @NSManaged public func removeFromProducts(_ values: NSSet)

}

extension Order : Identifiable {

}
