//
//  ProductRectangle.swift
//  OnlineStore
//
//  Created by Maximilian Le on 31.05.23.
//

import SwiftUI

struct ProductRectangle: View {
    var title: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill()
                .foregroundColor(.blue)
                .aspectRatio(contentMode: .fit)
                .shadow(radius: 5)
            Text(title)
                .font(.footnote)
        }
    }
}
