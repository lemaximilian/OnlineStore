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
    @NSManaged public var product: Product?
    @NSManaged public var user: User?

}

extension Review : Identifiable {

}
