//
//  PurchaseButton.swift
//  OnlineStore
//
//  Created by Maximilian Le on 31.07.23.
//

import SwiftUI

struct PurchaseButton: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var orderVM: OrderViewModel
    @State var showAlert: Bool = false
    @State var activeAlert: ActiveAlert = .first
    @Binding var showPopover: Bool
    var total: Float
    var fullName: String
    var address: String
    var postcode: Int32
    var city: String
    var shipping: String
    var payment: String
    var purchaseDate: Date
    
    var body: some View {
        Button {
            purchase()
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
        .alert(isPresented: $showAlert) {
            switch activeAlert {
            case .first: return missingAlert
            case .second: return purchasedAlert
            }
        }
    }
    
    var missingAlert: Alert {
        Alert(
            title: Text("Missing Shipping Information"),
            message: Text("Please enter your shipping information"),
            dismissButton: .default(Text("Confirm"))
        )
    }
    
    var purchasedAlert: Alert {
        Alert(
            title: Text("Purchased successfully!"),
            message: Text("Your purchase was successful and your order was placed"),
            dismissButton: .cancel(Text("OK")) {
                userVM.currentUser.shoppingCart.removeAll()
                userVM.save(viewContext: viewContext)
                showPopover = false
            }
        )
    }
    
    func purchase() {
        if fullName.isEmpty || address.isEmpty || city.isEmpty {
            activeAlert = .first
            showAlert = true
        } else {
            orderVM.addOrder(
                total: total,
                fullName: fullName,
                address: address,
                postcode: postcode,
                city: city,
                shipping: shipping,
                payment: payment,
                purchaseDate: purchaseDate,
                user: userVM.currentUser,
                products: Array(userVM.currentUser.shoppingCart),
                viewContext: viewContext
            )
            activeAlert = .second
            showAlert = true
        }
    }
}

