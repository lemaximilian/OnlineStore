//
//  ProductCounter.swift
//  OnlineStore
//
//  Created by Maximilian Le on 08.08.23.
//

import SwiftUI

struct ProductCounter: View {
    let productCount: Int
    
    var body: some View {
        HStack {
            Text("\(productCount) Products")
            Spacer()
        }
        .padding(.horizontal)
    }
}

