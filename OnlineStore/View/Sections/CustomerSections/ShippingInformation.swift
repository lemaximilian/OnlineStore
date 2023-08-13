//
//  ShippingInformation.swift
//  OnlineStore
//
//  Created by Maximilian Le on 13.08.23.
//

import SwiftUI

struct ShippingInformation: View {
    @EnvironmentObject var appVM: AppViewModel
    @Binding var fullName: String
    @Binding var address: String
    @Binding var postcode: Int32
    @Binding var city: String
    
    var body: some View {
        HStack {
            Text("Shipping Information")
                .font(.title3)
                .bold()
            Spacer()
        }
        .padding(.horizontal)
        
        TextField("Full Name", text: $fullName)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
        
        TextField("Address", text: $address)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
        
        HStack {
            TextField("Postcode", value: $postcode, formatter: appVM.numberFormatterInt)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
            TextField("City", text: $city)
                .textFieldStyle(.roundedBorder)
        }
        .padding(.horizontal)
        
        Divider()
            .padding(.horizontal)
    }
}

