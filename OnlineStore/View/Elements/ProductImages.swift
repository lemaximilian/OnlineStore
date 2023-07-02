//
//  ProductImages.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct ProductImages: View {
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    
    var body: some View {
        TabView {
            ForEach(placeholderVM.placeholder) { image in
                PlaceholderImage()
                    .aspectRatio(1, contentMode: .fit)
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .frame(minHeight: 475)
    }
}

