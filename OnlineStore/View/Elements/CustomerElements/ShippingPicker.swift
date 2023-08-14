//
//  ShippingPicker.swift
//  OnlineStore
//
//  Created by Maximilian Le on 14.08.23.
//

import SwiftUI

struct ShippingPicker: View {
    @Binding var selectedShipping: String
    
    var body: some View {
        Picker("Shipping", selection: $selectedShipping) {
            Text("Standard")
                .onTapGesture {
                    selectedShipping = "Standard"
                }
            Text("Express")
                .onTapGesture {
                    selectedShipping = "Express"
                }
        }
        .pickerStyle(.menu)
        .padding()
    }
}

