//
//  Product+CoreDataProperties.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.08.23.
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
    @NSManaged public var order: Set<Order>
    @NSManaged public var review: Set<Review>
    @NSManaged public var shoppingCart: Set<Product>
    
    public var unwrappedTitle: String {
        get { title ?? "Unknown Title" }
        set { title = newValue }
    }
    
    public var unwrappedDetails: String {
        get { details ?? "Unknown Details" }
        set { details = newValue }
    }
    
    public var unwrappedCategory: Category {
        get { category ?? Category() }
        set { category = newValue }
    }
    
    public var unwrappedHighlights: Data {
        get { highlights ?? Data() }
        set { highlights = newValue }
    }

}

// MARK: Generated accessors for order
extension Product {

    @objc(addOrderObject:)
    @NSManaged public func addToOrder(_ value: Order)

    @objc(removeOrderObject:)
    @NSManaged public func removeFromOrder(_ value: Order)

    @objc(addOrder:)
    @NSManaged public func addToOrder(_ values: NSSet)

    @objc(removeOrder:)
    @NSManaged public func removeFromOrder(_ values: NSSet)

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
