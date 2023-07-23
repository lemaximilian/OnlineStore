//
//  User+CoreDataProperties.swift
//  OnlineStore
//
//  Created by Maximilian Le on 21.07.23.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var birthdate: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var isSeller: Bool
    @NSManaged public var mail: String?
    @NSManaged public var password: String?
    @NSManaged public var username: String?
    @NSManaged public var review: Set<Review>
    @NSManaged public var shoppingCart: Set<Product>

//    public var shoppingCartArray: [Product] {
//        let set = shoppingCart as? Set<Product> ?? []
//        return set.sorted {
//            $0.id < $1.id
//        }
//    }
    
}

// MARK: Generated accessors for review
extension User {

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
extension User {

    @objc(addShoppingCartObject:)
    @NSManaged public func addToShoppingCart(_ value: Product)

    @objc(removeShoppingCartObject:)
    @NSManaged public func removeFromShoppingCart(_ value: Product)

    @objc(addShoppingCart:)
    @NSManaged public func addToShoppingCart(_ values: NSSet)

    @objc(removeShoppingCart:)
    @NSManaged public func removeFromShoppingCart(_ values: NSSet)

}

extension User : Identifiable {

}
