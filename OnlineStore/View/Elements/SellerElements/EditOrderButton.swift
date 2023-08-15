//
//  EditOrderButton.swift
//  OnlineStore
//
//  Created by Maximilian Le on 14.08.23.
//

import SwiftUI

struct EditOrderButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var orderVM: OrderViewModel
    @State var alertShown = false
    @State var activeAlert: ActiveAlert = .first
    @Binding var fullName: String
    @Binding var address: String
    @Binding var postcode: Int32
    @Binding var city: String
    var order: Order
    
    var body: some View {
        Button("Edit Order") {
            editOrder()
        }
        .alert(isPresented: $alertShown) {
            switch activeAlert {
            case .first: return missingAlert
            case .second: return editAlert
            }
        }
        .buttonStyle(.borderedProminent)
        .padding()
    }
    
    var missingAlert: Alert {
        Alert(
            title: Text("Missing Inputs"),
            message: Text("Please check your inputs"),
            dismissButton: .default(Text("Confirm"))
        )
    }
    
    var editAlert: Alert {
        Alert(
            title: Text("Order edited!"),
            dismissButton: .default(Text("OK")) {
                self.presentationMode.wrappedValue.dismiss()
            }
        )
    }
    
    func editOrder() {
        if fullName.isEmpty || address.isEmpty || city.isEmpty {
            activeAlert = .first
            alertShown = true
        } else {
            orderVM.editOrder(
                order: order,
                fullName: fullName,
                address: address,
                postcode: postcode,
                city: city,
                viewContext: viewContext
            )
            activeAlert = .second
            alertShown = true
        }
    }
}


