//
//  PurchaseButton.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct PurchaseButton: View {
    var body: some View {
        NavigationLink(destination: Checkout()) {
            HStack {
                Image(systemName: "eurosign")
                Text("Purchase")
            }
        }
        .buttonStyle(.borderedProminent)
        .padding()
//        Button {
//            showAlert = true
//        } label: {
//            HStack {
//                Image(systemName: "eurosign")
//                Text("Purchase")
//            }
//        }
//        .buttonStyle(.borderedProminent)
//        .padding()
//        .alert("Purchased successfully!", isPresented: $showAlert) {
//                    Button("OK", role: .cancel) { }
//        }
    }
}

