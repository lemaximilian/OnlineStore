//
//  ProductReviews.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct ProductReviews: View {
    let text = exampleText
    
    var body: some View {
        HStack {
            Text("Reviews")
                .font(.title2)
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top)
        
        HStack {
            Image(systemName: "star.fill")
            Image(systemName: "star.fill")
            Image(systemName: "star.fill")
            Image(systemName: "star.fill")
            Image(systemName: "star.fill")
            Spacer()
        }
        .padding()
        
        Text(text)
            .padding(.horizontal)
        
        Divider()
        
        HStack {
            Image(systemName: "star.fill")
            Image(systemName: "star.fill")
            Image(systemName: "star.fill")
            Image(systemName: "star")
            Image(systemName: "star")
            Spacer()
        }
        .padding()
        
        Text(text)
            .padding(.horizontal)
        
        Divider()
        
        HStack {
            Image(systemName: "star.fill")
            Image(systemName: "star.fill")
            Image(systemName: "star.fill")
            Image(systemName: "star.fill")
            Image(systemName: "star.leadinghalf.filled")
            Spacer()
        }
        .padding()
        
        Text(text)
            .padding(.horizontal)
    }
}

