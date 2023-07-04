//
//  Product+CoreDataProperties.swift
//  OnlineStore
//
//  Created by Maximilian Le on 04.07.23.
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
    @NSManaged public var image: Data?
    @NSManaged public var price: Float
    @NSManaged public var title: String?
    @NSManaged public var category: Category?
    @NSManaged public var review: NSSet?
    
    public var wrappedDetails: String {
        details ?? "Unknown Details"
    }
    
    public var wrappedHighlights: Data {
        highlights ?? Data()
    }
    
    public var wrappedId: UUID {
        id ?? UUID()
    }
    
    public var wrappedImage: Data {
        image ?? Data()
    }
    
    public var wrwappedPrice: Float {
        price
    }
    
    public var wrappedTitle: String {
        title ?? "Unknown Title"
    }
    
    public var wrappedCategory: Category {
        category ?? Category()
    }
    
    public var reviewArray: [Review] {
        let set = review as? Set<Review> ?? []
        return set.sorted {
            $0.wrappedTitle < $1.wrappedTitle
        }
    }

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

extension Product : Identifiable {

}
