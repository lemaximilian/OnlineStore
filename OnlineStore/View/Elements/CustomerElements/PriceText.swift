//
//  PriceText.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct PriceText: View {
    var price: Float
    
    var body: some View {
        HStack {
            Spacer()
            Text(String(price) + "€")
                .font(.title2)
                .bold()
        }
        .padding()
    }
}

