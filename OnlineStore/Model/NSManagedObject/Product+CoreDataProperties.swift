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
    @NSManaged public var review: Review?

}

extension Product : Identifiable {

}
