//
//  Product+CoreDataProperties.swift
//  OnlineStore
//
//  Created by Maximilian Le on 21.07.23.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var details: String?
    @NSManaged public var highlights: Data?
    @NSManaged public var id: UUID?
    @NSManaged public var images: Data?
    @NSManaged public var price: Float
    @NSManaged public var title: String?
    @NSManaged public var category: Category?
    @NSManaged public var review: Set<Review>
    @NSManaged public var shoppingCart: Set<User>

}

// MARK: Generated accessors for review
extension Product {

    @objc(addReviewObject:)
    @NSManaged public func addToReview(_ value: Review)

    @objc(removeReviewObject:)
    @NSManaged public func removeFromReview(_ value: Review)

    @objc(addReview:)
    @NSManaged public func addToReview(_ values: NSSet)

    @objc(removeReview:)
    @NSManaged public func removeFromReview(_ values: NSSet)

}

// MARK: Generated accessors for shoppingCart
extension Product {

    @objc(addShoppingCartObject:)
    @NSManaged public func addToShoppingCart(_ value: User)

    @objc(removeShoppingCartObject:)
    @NSManaged public func removeFromShoppingCart(_ value: User)

    @objc(addShoppingCart:)
    @NSManaged public func addToShoppingCart(_ values: NSSet)

    @objc(removeShoppingCart:)
    @NSManaged public func removeFromShoppingCart(_ values: NSSet)

}

extension Product : Identifiable {

}
