//
//  ProductDescription.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct ProductDescription: View {
    let text = exampleText
    var description: String?
    
    var body: some View {
        HStack {
            Text("Description")
                .font(.title2)
            Spacer()
        }
        .padding()

        Text(description ?? "")
            .padding(.horizontal)
    }
}

