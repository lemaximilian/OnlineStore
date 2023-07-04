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
    @NSManaged public var review: Review?

}

extension User : Identifiable {

}
