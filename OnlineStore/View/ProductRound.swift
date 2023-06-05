//
//  ProductRound.swift
//  OnlineStore
//
//  Created by Maximilian Le on 05.06.23.
//

import SwiftUI

struct ProductRound: View {
    var title: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill()
                .foregroundColor(.blue)
                .aspectRatio(contentMode: .fit)
            Text(title)
                .font(.footnote)
        }

    }
}

