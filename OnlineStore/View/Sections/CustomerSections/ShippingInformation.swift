//
//  ShippingInformation.swift
//  OnlineStore
//
//  Created by Maximilian Le on 16.08.23.
//

import SwiftUI

struct ShippingInformation: View {
    @EnvironmentObject var appVM: AppViewModel
    var order: Order
    
    var body: some View {
        HStack {
            Text("Shipping Information")
                .font(.title3)
                .bold()
            Spacer()
        }
        .padding(.horizontal)
        
        VStack(alignment: .leading) {
            Text("Full Name: \(order.unwrappedFullName)")
                .padding(.top)
                .padding(.horizontal)
            
            Text("Address: \(order.unwrappedAddress)")
                .padding(.horizontal)
            
            Text("Postcode: \(appVM.numberFormatterInt.string(from: NSNumber(value: order.postcode)) ?? "")")
                .padding(.horizontal)
            
            Text("City: \(order.unwrappedCity)")
                .padding(.bottom)
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
        Divider()
            .padding(.horizontal)
    }
}

