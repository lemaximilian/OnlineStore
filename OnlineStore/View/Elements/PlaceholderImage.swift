//
//  PlaceholderImage.swift
//  OnlineStore
//
//  Created by Maximilian Le on 14.06.23.
//

import SwiftUI

struct PlaceholderImage: View {
    var body: some View {
        ZStack {
            Rectangle()
                .stroke()
            Image(systemName: "photo")
        }
        .padding(.horizontal)
    }
}
