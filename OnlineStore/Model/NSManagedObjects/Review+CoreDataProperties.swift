//
//  Review+CoreDataProperties.swift
//  OnlineStore
//
//  Created by Maximilian Le on 04.07.23.
//
//

import Foundation
import CoreData


extension Review {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Review> {
        return NSFetchRequest<Review>(entityName: "Review")
    }

    @NSManaged public var title: String?
    @NSManaged public var comment: String?
    @NSManaged public var id: UUID?
    @NSManaged public var product: Product?
    @NSManaged public var user: User?
    
    public var wrappedTitle: String {
        title ?? "Unknown Title"
    }
    
    public var wrappedComment: String {
        comment ?? "Unknown Comment"
    }
    
    public var wrappedId: UUID {
        id ?? UUID()
    }
    
    public var wrappedProduct: Product {
        product ?? Product()
    }
    
    public var wrappedUser: User {
        user ?? User()
    }
    
}

extension Review : Identifiable {

}
