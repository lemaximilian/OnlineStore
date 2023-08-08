//
//  PaymentOptionCheckbox.swift
//  OnlineStore
//
//  Created by Maximilian Le on 08.08.23.
//

import SwiftUI

struct PaymentOptionCheckbox: View {
    @EnvironmentObject var userVM: UserViewModel
    @Binding var checkedPayment: Bool
    let imageString1: String
    let imageString2: String
    let boolSet: Bool
    
    
    var body: some View {
        HStack {
            Image(systemName: checkedPayment ? imageString1 : imageString2)
                .foregroundColor(.blue)
                .onTapGesture {
                    checkedPayment = boolSet
                }
            HStack {
                if boolSet {
                    Image("PayPal")
                        .resizable()
                        .frame(width: 25, height: 25)
                    Text("PayPal (\(userVM.currentUser.mail ?? "Unknown Mail"))")
                    Spacer()
                } else {
                    Image(systemName: "creditcard")
                    Text("Credit Card (●●●●●●●●●●900)")
                    Spacer()
                }
            }
        }
        .padding()
    }
}

