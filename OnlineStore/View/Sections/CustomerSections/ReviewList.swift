//
//  ReviewList.swift
//  OnlineStore
//
//  Created by Maximilian Le on 16.08.23.
//

import SwiftUI

struct ReviewList: View {
    var product: Product
    
    var body: some View {
        ForEach(Array(product.review)) { review in
            ReviewItem(review: review)
        }
    }
}

