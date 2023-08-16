//
//  Ticket+CoreDataProperties.swift
//  OnlineStore
//
//  Created by Maximilian Le on 14.08.23.
//
//

import Foundation
import CoreData


extension Ticket {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ticket> {
        return NSFetchRequest<Ticket>(entityName: "Ticket")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var subject: String?
    @NSManaged public var request: String?
    @NSManaged public var isProcessed: Bool
    @NSManaged public var user: User?

    public var unwrappedSubject: String {
        get { subject ?? "Unknown Subject" }
        set { subject = newValue }
    }
    
    public var unwrappedRequest: String {
        get { request ?? "Unknown Request" }
        set { request = newValue }
    }
}

extension Ticket : Identifiable {

}
