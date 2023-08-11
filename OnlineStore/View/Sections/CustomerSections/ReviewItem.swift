//
//  ReviewItem.swift
//  OnlineStore
//
//  Created by Maximilian Le on 09.08.23.
//

import SwiftUI

struct ReviewItem: View {
    @EnvironmentObject var appVM: AppViewModel
    let maximumRating = 5
    let review: Review
    
    var body: some View {
        HStack {
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                starImage(for: number)
            }
            Spacer()
        }
        .padding()
        
        VStack(alignment: .leading) {
            HStack {
                Text(review.title ?? "Unknown Title")
                    .bold()
                Spacer()
                Text(appVM.dateFormatter.string(from: review.creationDate ?? Date()))
            }
            .padding(.horizontal)
            
            Text("reviewed by \(review.user?.username ?? "Unknown Username")")
                .font(.footnote)
                .foregroundColor(.secondary)
                .padding(.horizontal)
            
            Text(review.comment ?? "Unknown Comment")
                .padding()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
        Divider()
        
    }
    
    func starImage(for number: Int) -> Image {
        if number > review.rating {
            return Image(systemName: "star")
        } else {
            return Image(systemName: "star.fill")
        }
    }
}


