//
//  PurchaseButton.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct PurchaseButton: View {
    @Binding var showAlert: Bool
    
    var body: some View {
        Button {
            showAlert = true
        } label: {
            HStack {
                Image(systemName: "eurosign")
                Text("Purchase")
            }
        }
        .buttonStyle(.borderedProminent)
        .padding()
        .alert("Purchased successfully!", isPresented: $showAlert) {
                    Button("OK", role: .cancel) { }
        }
    }
}

