//
//  ProductHighlights.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct ProductHighlights: View {
    var highlightArray: [String]
    
    var body: some View {
        HStack {
            Text("Highlights")
                .font(.title2)
            Spacer()
        }
        .padding()
        
        ForEach(highlightArray, id: \.self) { highlight in
            HStack {
                Text(highlight)
                Spacer()
            }
            .padding(.horizontal)
            Divider()
        }
    }
}
