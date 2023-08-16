//
//  ProductReviews.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct ProductReviews: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var productVM: ProductViewModel
    @EnvironmentObject var reviewVM: ReviewViewModel
    @State var showSheet = false
    let text = exampleText
    let currentProduct: Product
    
    var body: some View {
        HStack {
            Text("Reviews")
                .font(.title2)
            Spacer()
            Button {
                showSheet = true
            } label: {
                HStack {
                    Image(systemName: "square.and.pencil")
                    Text("Add Review")
                }
            }
        }
        .padding(.horizontal)
        .padding(.top)
        .fullScreenCover(isPresented: $showSheet, onDismiss: {
            productVM.save(viewContext: viewContext)
            reviewVM.save(viewContext: viewContext)
        }) {
            AddReview(showSheet: $showSheet, currentProduct: currentProduct)
        }
        
        if currentProduct.review.isEmpty {
            Text("There are currently no reviews")
                .padding()
        } else {
            ReviewList(product: currentProduct)
        }
    }
}

