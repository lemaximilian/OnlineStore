//
//  ProductViewModel.swift
//  OnlineStore
//
//  Created by Maximilian Le on 19.07.23.
//

import SwiftUI
import CoreData

class ProductViewModel: ObservableObject {
    let controller = PersistenceController.shared
    @Published var products: [Product] = []
    
    func fetchProducts(viewContext: NSManagedObjectContext) {
        let request = NSFetchRequest<Product>(entityName: "Product")
        
        do {
            products = try viewContext.fetch(request)
        } catch let error {
            print("Error while fetching. \(error.localizedDescription)")
        }
    }
    
    func addProduct(
        title: String,
        price: Float,
        details: String,
        category: Category,
        highlights: [String],
        images: [Data?],
        viewContext: NSManagedObjectContext
    ) {
        let encoder = JSONEncoder()
        let product = Product(context: viewContext)
        product.id = UUID()
        product.title = title
        product.price = price
        product.details = details
        product.category = category
        
        let reviews: [Review] = []
        product.review = Set(reviews)
        
        category.product.insert(product)
        
        do {
            product.highlights = try encoder.encode(highlights)
        } catch {
            print("Failed to archive Highlight Array.")
        }
        do {
            product.images = try encoder.encode(images)
        } catch {
            print("Failed to archive Image Array.")
        }
        save(viewContext: viewContext)
    }
    
    func editProduct(
        product: Product,
        title: String,
        price: Float,
        details: String,
        category: Category,
        highlights: [String],
        images: [Data?],
        viewContext: NSManagedObjectContext
    ) {
        let encoder = JSONEncoder()
        product.title = title
        product.price = price
        product.details = details
        product.category = category
        do {
            product.highlights = try encoder.encode(highlights)
        } catch {
            print("Failed to archive Highlight Array.")
        }
        do {
            product.images = try encoder.encode(images)
        } catch {
            print("Failed to archive Image Array.")
        }
        save(viewContext: viewContext)
    }
    
    func removeProduct(at offsets: IndexSet, products: FetchedResults<Product>, viewContext: NSManagedObjectContext) {
        for index in offsets {
            let product = products[index]
            viewContext.delete(product)
        }
        save(viewContext: viewContext)
    }
    
    // calculate total for array of products
    func calcTotal(products: [Product]) -> Float {
        var total: Float = 0.0
        for product in products {
            total += product.price
        }
        return total
    }
    
    func fetchProductImages(
        product: Product,
        viewContext: NSManagedObjectContext
    ) -> [Data] {
        let decoder = JSONDecoder()
        var imageArray: [Data] = []
        do {
            let loadedImages =  try decoder.decode([Data].self, from: product.images ?? Data())
            imageArray = loadedImages
        } catch let error {
            print("Could not unarchive Image Array. \(error.localizedDescription)")
        }
        return imageArray
    }
    
    func fetchProductHighlights(
        product: Product,
        viewContext: NSManagedObjectContext
    ) -> [String] {
        let decoder = JSONDecoder()
        var highlightArray: [String] = []
        do {
            let loadedHighlights =  try decoder.decode([String].self, from: product.highlights ?? Data())
            highlightArray = loadedHighlights
        } catch let error {
            print("Could not unarchive Highlight Array. \(error.localizedDescription)")
        }
        return highlightArray
    }
    
    func getHighlightsBinding(product: Product, viewContext: NSManagedObjectContext) -> Binding<[String]> {
        var highlightArray = fetchProductHighlights(product: product, viewContext: viewContext)
        return Binding(get: { highlightArray }, set: { highlightArray = $0 })
    }
    
    func getImagesBinding(product: Product, viewContext: NSManagedObjectContext) -> Binding<[Data?]> {
        var imageArray: [Data?] = fetchProductImages(product: product, viewContext: viewContext)
        return Binding(get: { imageArray }, set: { imageArray = $0 })
    }
    
    func save(viewContext: NSManagedObjectContext) {
        products.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.controller.save(viewContext: viewContext)
            self.fetchProducts(viewContext: viewContext)
        }
    }
}


