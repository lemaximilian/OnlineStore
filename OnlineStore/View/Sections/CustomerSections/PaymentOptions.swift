//
//  PaymentOptions.swift
//  OnlineStore
//
//  Created by Maximilian Le on 08.08.23.
//

import SwiftUI

struct PaymentOptions: View {
    @Binding var checkedPayment: Bool
    
    var body: some View {
        HStack {
            Text("Payment")
                .font(.title3)
                .bold()
            Spacer()
        }
        .padding(.horizontal)
        
        PaymentOptionCheckbox(checkedPayment: $checkedPayment, imageString1: "circle.circle.fill", imageString2: "circle", boolSet: true)
        
        PaymentOptionCheckbox(checkedPayment: $checkedPayment, imageString1: "circle", imageString2: "circle.circle.fill", boolSet: false)
    }
}


