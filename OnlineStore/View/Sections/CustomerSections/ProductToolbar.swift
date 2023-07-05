//
//  ProductToolbar.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct ProductToolbar: View {
    @Binding var showAlert: Bool
    var currentProduct: Product

    var body: some View {
        HStack {
            Button {
                showAlert = true
            } label: {
                HStack {
                    Image(systemName: "cart")
                    Text("Add to Shopping Cart")
                }
            }
            .buttonStyle(.borderedProminent)
            .padding(.top)
            .alert("Added to Shopping Cart", isPresented: $showAlert) {
                        Button("OK", role: .cancel) { }
            }
            
            Button {
                // Set as favourite
            } label: {
                Image(systemName: "heart")
            }
            .buttonStyle(.borderedProminent)
            .padding(.top)
        }
    }
}

