//
//  OrderViewModel.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.08.23.
//

import SwiftUI
import CoreData

class OrderViewModel: ObservableObject {
    let controller = PersistenceController.shared
    @Published var orders: [Order] = []
    
    func fetchOrders(viewContext: NSManagedObjectContext) {
        let request = NSFetchRequest<Order>(entityName: "Order")
        
        do {
            orders = try viewContext.fetch(request)
        } catch let error {
            print("Error while fetching. \(error.localizedDescription)")
        }
    }
    
    func addOrder(
        total: Float,
        fullName: String,
        address: String,
        postcode: Int32,
        city: String,
        shipping: String,
        payment: String,
        purchaseDate: Date,
        user: User,
        products: [Product],
        viewContext: NSManagedObjectContext
    ) {
        let order = Order(context: viewContext)
        order.id = UUID()
        order.total = total
        order.fullName = fullName
        order.address = address
        order.postcode = postcode
        order.city = city
        order.shipping = shipping
        order.payment = payment
        order.purchaseDate = purchaseDate
        order.isShipped = false
        order.user = user
        order.products = Set(products)
        user.orders.insert(order)
        save(viewContext: viewContext)
    }
    
    func shipOrder(
        order: Order,
        viewContext: NSManagedObjectContext
    ) {
        let shippedOrder = ShippedOrder(context: viewContext)
        shippedOrder.id = UUID()
        shippedOrder.order = order
        order.isShipped = true
        order.shipped = shippedOrder
        save(viewContext: viewContext)
    }
    
    func editOrder(
        order: Order,
        fullName: String,
        address: String,
        postcode: Int32,
        city: String,
        viewContext: NSManagedObjectContext
    ) {
        order.fullName = fullName
        order.address = address
        order.postcode = postcode
        order.city = city
        save(viewContext: viewContext)
    }
    
    func removeOrder(at offsets: IndexSet, orders: FetchedResults<Order>, viewContext: NSManagedObjectContext) {
        for index in offsets {
            let order = orders[index]
            viewContext.delete(order)
        }
        save(viewContext: viewContext)
    }
    
    func save(viewContext: NSManagedObjectContext) {
        orders.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.controller.save(viewContext: viewContext)
            self.fetchOrders(viewContext: viewContext)
        }
    }
}

