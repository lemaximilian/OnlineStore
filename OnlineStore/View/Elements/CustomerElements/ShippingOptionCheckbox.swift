//
//  ShippingOptionCheckbox.swift
//  OnlineStore
//
//  Created by Maximilian Le on 08.08.23.
//

import SwiftUI

struct ShippingOptionCheckbox: View {
    @Binding var checkedShipping: Bool
    let imageString1: String
    let imageString2: String
    let boolSet: Bool
    let title: String
    let subtitle: String
    let priceString: String
    
    var body: some View {
        HStack {
            Image(systemName: checkedShipping ? imageString1 : imageString2)
                .foregroundColor(.blue)
                .onTapGesture {
                    checkedShipping = boolSet
                }
            VStack {
                HStack {
                    Text(title)
                    Spacer()
                }
                
                HStack {
                    Text(subtitle)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    Spacer()
                }
                
            }
            Spacer()
            Text(priceString)
        }
        .padding()
    }
}
