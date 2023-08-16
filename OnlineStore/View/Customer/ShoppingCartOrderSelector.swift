//
//  ShoppingCartOrderSelector.swift
//  OnlineStore
//
//  Created by Maximilian Le on 16.08.23.
//

import SwiftUI

struct ShoppingCartOrderSelector: View {
    @Binding var selectedSegment: String
    
    var body: some View {
        HStack {
            if selectedSegment == "shoppingcart" {
                ShoppingCartContent()
            } else {
                Orders()
            }
        }
    }
}

