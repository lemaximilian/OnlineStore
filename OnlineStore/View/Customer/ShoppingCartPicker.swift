//
//  ShoppingCartPicker.swift
//  OnlineStore
//
//  Created by Maximilian Le on 04.08.23.
//

import SwiftUI

struct ShoppingCartPicker: View {
    @State var selectedSegment = "shoppingcart"
    
    var body: some View {
        VStack {
            Picker("", selection: $selectedSegment) {
                Text("Shopping Cart").tag("shoppingcart")
                Text("Orders").tag("orders")
            }
            .pickerStyle(.segmented)
            .padding()
            
            Spacer()
            
            HStack {
                if selectedSegment == "shoppingcart" {
                    ShoppingCartView()
                } else {
                    Orders()
                }
            }
            
            Spacer()
        }
    }
}
