//
//  AddReviewButton.swift
//  OnlineStore
//
//  Created by Maximilian Le on 16.08.23.
//

import SwiftUI

struct AddReviewButton: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var productVM: ProductViewModel
    @EnvironmentObject var reviewVM: ReviewViewModel
    @Binding var showSheet: Bool
    var title: String
    var comment: String
    var rating: Int
    var product: Product
    
    var body: some View {
        Button("Add Review") {
            reviewVM.addReview(
                title: title,
                comment: comment,
                rating: Int16(rating),
                product: product,
                user: userVM.currentUser,
                viewContext: viewContext
            )
            userVM.save(viewContext: viewContext)
            productVM.save(viewContext: viewContext)
            showSheet = false
        }
        .buttonStyle(.borderedProminent)
        .padding(.top)
    }
}


