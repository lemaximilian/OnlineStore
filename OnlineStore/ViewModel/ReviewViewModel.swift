//
//  ReviewViewModel.swift
//  OnlineStore
//
//  Created by Maximilian Le on 09.08.23.
//

import SwiftUI
import CoreData

class ReviewViewModel: ObservableObject {
    let controller = PersistenceController.shared
    @Published var reviews: [Review] = []
    
    func fetchReviews(viewContext: NSManagedObjectContext) {
        let request = NSFetchRequest<Review>(entityName: "Review")
        
        do {
            reviews = try viewContext.fetch(request)
        } catch let error {
            print("Error while fetching. \(error.localizedDescription)")
        }
    }
    
    func addReview(
        title: String,
        comment: String,
        rating: Int16,
        product: Product,
        user: User,
        viewContext: NSManagedObjectContext
    ) {
        let review = Review(context: viewContext)
        review.id = UUID()
        review.title = title
        review.comment = comment
        review.rating = rating
        review.creationDate = Date()
        review.product = product
        review.user = user
        product.review.insert(review)
        user.review.insert(review)
        save(viewContext: viewContext)
    }
    
    func getStarImage(for number: Int, rating: Int) -> Image {
        if number > rating {
            return Image(systemName: "star")
        } else {
            return Image(systemName: "star.fill")
        }
    }
    
    func save(viewContext: NSManagedObjectContext) {
        reviews.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.controller.save(viewContext: viewContext)
            self.fetchReviews(viewContext: viewContext)
        }
    }
    
}

