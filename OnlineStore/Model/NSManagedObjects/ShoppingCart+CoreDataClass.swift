//
//  ShoppingCart+CoreDataClass.swift
//  OnlineStore
//
//  Created by Maximilian Le on 04.07.23.
//
//

import Foundation
import CoreData

@objc(ShoppingCart)
public class ShoppingCart: NSManagedObject, Codable {
    enum CodingKeys: CodingKey {
        case id, products, user
    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }

        self.init(context: context)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.products = try container.decode(Data.self, forKey: .products)
        self.user = try container.decode(User.self, forKey: .user)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(products, forKey: .products)
        try container.encode(user, forKey: .user)
    }
}
