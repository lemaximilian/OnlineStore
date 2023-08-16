//
//  ReviewItem.swift
//  OnlineStore
//
//  Created by Maximilian Le on 09.08.23.
//

import SwiftUI

struct ReviewItem: View {
    @EnvironmentObject var appVM: AppViewModel
    @EnvironmentObject var reviewVM: ReviewViewModel
    let maximumRating = 5
    let review: Review
    
    var body: some View {
        HStack {
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                reviewVM.getStarImage(for: number, rating: Int(review.rating))
            }
            Spacer()
        }
        .padding()
        
        VStack(alignment: .leading) {
            HStack {
                Text(review.unwrappedTitle)
                    .bold()
                Spacer()
                Text(appVM.dateFormatter.string(from: review.unwrappedCreationDate))
            }
            .padding(.horizontal)
            
            Text("reviewed by \(review.user?.username ?? "Unknown Username")")
                .font(.footnote)
                .foregroundColor(.secondary)
                .padding(.horizontal)
            
            Text(review.unwrappedComment)
                .padding()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
        Divider()
        
    }
}


