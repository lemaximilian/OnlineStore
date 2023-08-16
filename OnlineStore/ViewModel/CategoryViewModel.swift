//
//  CategoryViewModel.swift
//  OnlineStore
//
//  Created by Maximilian Le on 16.08.23.
//

import SwiftUI
import CoreData

class CategoryViewModel: ObservableObject {
    let controller = PersistenceController.shared
    @Published var categories: [Category] = []
    
    func fetchCategories(viewContext: NSManagedObjectContext) {
        let request = NSFetchRequest<Category>(entityName: "Category")
        
        do {
            categories = try viewContext.fetch(request)
        } catch let error {
            print("Error while fetching. \(error.localizedDescription)")
        }
    }
    
    func addCategory(
        title: String,
        image: Data?,
        viewContext: NSManagedObjectContext
    ) {
        let category = Category(context: viewContext)
        category.id = UUID()
        category.title = title
        category.image = image
        let products: [Product] = []
        category.product = Set(products)
        save(viewContext: viewContext)
    }
    
    func save(viewContext: NSManagedObjectContext) {
        categories.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.controller.save(viewContext: viewContext)
            self.fetchCategories(viewContext: viewContext)
        }
    }
}


