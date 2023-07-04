//
//  Category+CoreDataProperties.swift
//  OnlineStore
//
//  Created by Maximilian Le on 04.07.23.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var image: Data?
    @NSManaged public var order: Int16
    @NSManaged public var title: String?
    @NSManaged public var product: NSSet?
    
    public var wrappedId: UUID {
        id ?? UUID()
    }
    
    public var wrappedImage: Data {
        image ?? Data()
    }
    
    public var wrappedOrder: Int16 {
        order
    }
    
    public var wrappedTitle: String {
        title ?? "Unknown Title"
    }
    
    public var productArray: [Product] {
        let set = product as? Set<Product> ?? []
        return set.sorted {
            $0.wrappedTitle < $1.wrappedTitle
        }
    }
}

// MARK: Generated accessors for product
extension Category {

    @objc(addProductObject:)
    @NSManaged public func addToProduct(_ value: Product)

    @objc(removeProductObject:)
    @NSManaged public func removeFromProduct(_ value: Product)

    @objc(addProduct:)
    @NSManaged public func addToProduct(_ values: NSSet)

    @objc(removeProduct:)
    @NSManaged public func removeFromProduct(_ values: NSSet)

}

extension Category : Identifiable {

}