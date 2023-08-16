//
//  AddReview.swift
//  OnlineStore
//
//  Created by Maximilian Le on 09.08.23.
//

import SwiftUI

struct AddReview: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var productVM: ProductViewModel
    @EnvironmentObject var reviewVM: ReviewViewModel
    @Binding var showSheet: Bool
    @State var title: String = ""
    @State var comment: String = ""
    @State var rating = 0
    let maximumRating = 5
    let currentProduct: Product
    
    var body: some View {
        NavigationView {
            VStack {
                AddReviewFields(title: $title, comment: $comment)
                
                Text("Rate the Product")
                    .bold()
                
                AddReviewStars(rating: $rating, maximumRating: maximumRating)

                AddReviewButton(
                    showSheet: $showSheet,
                    title: title,
                    comment: comment,
                    rating: rating,
                    product: currentProduct
                )
            }
            .navigationTitle("Add Review")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        showSheet = false
                    }
                }
            }
        }
    }
    
    
}


