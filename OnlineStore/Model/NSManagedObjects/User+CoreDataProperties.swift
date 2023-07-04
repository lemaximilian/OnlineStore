//
//  User+CoreDataProperties.swift
//  OnlineStore
//
//  Created by Maximilian Le on 04.07.23.
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
    @NSManaged public var shoppingCart: ShoppingCart?
    @NSManaged public var review: NSSet?
    
    public var wrappedBirthdate: Date {
        birthdate ?? Date()
    }
    
    public var wrappedId: UUID {
        id ?? UUID()
    }
    
    public var wrappedIsSeller: Bool {
        isSeller
    }
    
    public var wrappedMail: String {
        mail ?? "Unknown Mail"
    }
    
    public var wrappedPassword: String {
        password ?? "Unknown Password"
    }
    
    public var wrappedUsername: String {
        username ?? "Unknown Username"
    }
    
    public var wrappedShoppingCart: ShoppingCart {
        shoppingCart ?? ShoppingCart()
    }
    
    public var reviewArray: [Review] {
        let set = review as? Set<Review> ?? []
        return set.sorted {
            $0.wrappedTitle < $1.wrappedTitle
        }
    }

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

extension User : Identifiable {

}
