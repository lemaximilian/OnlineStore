//
//  PriceText.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct PriceText: View {
    var body: some View {
        HStack {
            Spacer()
            Text("Price: 119.99€")
                .font(.title2)
                .bold()
        }
        .padding()
    }
}

