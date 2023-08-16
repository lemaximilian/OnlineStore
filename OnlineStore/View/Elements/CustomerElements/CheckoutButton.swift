//
//  CheckoutButton.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct CheckoutButton: View {
    @State var showPopover: Bool = false
    
    var body: some View {
        Button {
            showPopover = true
        } label: {
            HStack {
                Image(systemName: "bag.fill")
                Text("Checkout")
            }
        }
        .buttonStyle(.borderedProminent)
        .padding()
        .popover(isPresented: $showPopover) {
            Checkout(showPopover: $showPopover)
        }
    }
}

