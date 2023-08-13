//
//  PurchaseButton.swift
//  OnlineStore
//
//  Created by Maximilian Le on 31.07.23.
//

import SwiftUI

struct PurchaseButton: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var orderVM: OrderViewModel
    @EnvironmentObject var notificationVM: NotificationViewModel
    @State var showAlert: Bool = false
    @Binding var showPopover: Bool
    var total: Float
    var fullName: String
    var address: String
    var postcode: Int32
    var city: String
    var shipping: String
    var payment: String
    var purchaseDate: Date
    var user: User
    var products: [Product]
    
    var body: some View {
        Button {
            orderVM.addOrder(
                total: total,
                fullName: fullName,
                address: address,
                postcode: postcode,
                city: city,
                shipping: shipping,
                payment: payment,
                purchaseDate: purchaseDate,
                user: user,
                products: products,
                viewContext: viewContext
            )
            showAlert = true
        } label: {
            HStack {
                Image(systemName: "eurosign")
                Text("Purchase")
                    .bold()
            }
            .frame(width: 350, height: 35)
            
        }
        .buttonStyle(.borderedProminent)
        .padding()
        .alert("Purchased successfully!", isPresented: $showAlert) {
                    Button("OK", role: .cancel) {
                        notificationVM.unsubscribeNotification()
                        showPopover = false
                    }
        }
        
    }
}

