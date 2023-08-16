//
//  PaymentChoice.swift
//  OnlineStore
//
//  Created by Maximilian Le on 16.08.23.
//

import SwiftUI

struct PaymentChoice: View {
    var order: Order
    
    var body: some View {
        HStack {
            Text("Payment")
                .font(.title3)
                .bold()
            Spacer()
        }
        .padding(.horizontal)
        
        HStack {
            if order.payment == "PayPal" {
                Image("PayPal")
                    .resizable()
                    .frame(width: 25, height: 25)
            } else {
                Image(systemName: "creditcard")
            }
            Text(order.payment == "PayPal" ? "PayPal (\(order.user?.mail ?? "Unknown Mail"))" : "Credit Card (●●●●●●●●●●900)")
            Spacer()
        }
        .padding()
    }
}

