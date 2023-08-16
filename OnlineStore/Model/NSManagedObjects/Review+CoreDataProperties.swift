//
//  Review+CoreDataProperties.swift
//  OnlineStore
//
//  Created by Maximilian Le on 21.07.23.
//
//

import Foundation
import CoreData


extension Review {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Review> {
        return NSFetchRequest<Review>(entityName: "Review")
    }

    @NSManaged public var comment: String?
    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var rating: Int16
    @NSManaged public var creationDate: Date?
    @NSManaged public var product: Product?
    @NSManaged public var user: User?

    public var unwrappedTitle: String {
        get { title ?? "Unknown Title" }
        set { title = newValue }
    }
    
    public var unwrappedComment: String {
        get { comment ?? "Unknown Comment" }
        set { comment = newValue }
    }
    
    public var unwrappedCreationDate: Date {
        get { creationDate ?? Date() }
        set { creationDate = newValue }
    }
}

extension Review : Identifiable {

}
