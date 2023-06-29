//
//  RectangleButton.swift
//  OnlineStore
//
//  Created by Maximilian Le on 11.06.23.
//

import SwiftUI

struct RectangleButton: View {
    var title: String
    var image: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill()
                .foregroundColor(.blue)
                .aspectRatio(contentMode: .fit)
                .shadow(radius: 5)
            VStack {
                Image(systemName: image)
                    .resizable()
                    .frame(width: 50, height: 50)
                Text(title)
                    .font(.footnote)
                    .bold()
            }
            .padding()
        }
    }
}

