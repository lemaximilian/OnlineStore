//
//  ShippingChoice.swift
//  OnlineStore
//
//  Created by Maximilian Le on 16.08.23.
//

import SwiftUI

struct ShippingChoice: View {
    var order: Order
    
    var body: some View {
        HStack {
            Text("Shipping")
                .font(.title3)
                .bold()
            Spacer()
        }
        .padding(.horizontal)
        
        HStack {
            VStack(alignment: .leading) {
                Text(order.shipping == "Standard" ? "Standard" : "Express")
                
                Text(order.shipping == "Standard" ? "2-4 business days" : "1 business day")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            Text(order.shipping == "Standard" ? "Free" : "+4,99€")
        }
        .padding()
        
        Divider()
            .padding(.horizontal)
    }
}

