//
//  ShippedOrder+CoreDataProperties.swift
//  OnlineStore
//
//  Created by Maximilian Le on 14.08.23.
//
//

import Foundation
import CoreData


extension ShippedOrder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ShippedOrder> {
        return NSFetchRequest<ShippedOrder>(entityName: "ShippedOrder")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var order: Order?

}

extension ShippedOrder : Identifiable {

}
