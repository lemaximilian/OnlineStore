//
//  ShippingOptions.swift
//  OnlineStore
//
//  Created by Maximilian Le on 08.08.23.
//

import SwiftUI

struct ShippingOptions: View {
    @Binding var checkedShipping: Bool
    
    var body: some View {
        HStack {
            Text("Shipping")
                .font(.title3)
                .bold()
            Spacer()
        }
        .padding(.horizontal)
        
        ShippingOptionCheckbox(checkedShipping: $checkedShipping, imageString1: "circle.circle.fill", imageString2: "circle", boolSet: true, title: "Standard", subtitle: "2-4 business days", priceString: "Free")
        
        ShippingOptionCheckbox(checkedShipping: $checkedShipping, imageString1: "circle", imageString2: "circle.circle.fill", boolSet: false, title: "Express", subtitle: "1 business day", priceString: "+4,99€")
        
        Divider()
            .padding(.horizontal)
    }
}
