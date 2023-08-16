//
//  AddReviewStars.swift
//  OnlineStore
//
//  Created by Maximilian Le on 16.08.23.
//

import SwiftUI

struct AddReviewStars: View {
    @EnvironmentObject var reviewVM: ReviewViewModel
    @Binding var rating: Int
    var maximumRating: Int
    
    var body: some View {
        ForEach(1..<maximumRating + 1, id: \.self) { number in
            reviewVM.getStarImage(for: number, rating: rating)
                .onTapGesture {
                    rating = number
                }
        }
    }
}

