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
    @State var showAlert: Bool = false
    var total: Float
    var shipping: String
    var payment: String
    var purchaseDate: Date
    var user: User
    var products: [Product]
    
    var body: some View {
        Button {
            orderVM.addOrder(
                total: total,
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
                    Button("OK", role: .cancel) { }
        }
        
    }
}

