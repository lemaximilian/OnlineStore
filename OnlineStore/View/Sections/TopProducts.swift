//
//  TopProducts.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct TopProducts: View {
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
        
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
            ForEach(placeholderVM.placeholder) { placeholder in
                NavigationLink(destination: ProductPage(currentPlaceholder: placeholder)) {
                    ProductRectangle(title: placeholder.title)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

