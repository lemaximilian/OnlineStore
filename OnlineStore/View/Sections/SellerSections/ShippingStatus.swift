//
//  ShippingStatus.swift
//  OnlineStore
//
//  Created by Maximilian Le on 16.08.23.
//

import SwiftUI

struct ShippingStatus: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var orderVM: OrderViewModel
    @State var showAlert = false
    var order: Order
    
    var body: some View {
        HStack {
            Text("Shipping Status")
                .font(.title3)
                .bold()
            Spacer()
        }
        .padding(.horizontal)
        
        HStack {
            Image(systemName: order.isShipped ? "checkmark.circle.fill" : "circle")
                .foregroundColor(order.isShipped ? .secondary : .primary)
                .alert(isPresented: $showAlert) {
                    shipOrderAlert
                }
                .onTapGesture {
                    if !(order.isShipped) {
                        showAlert = true
                    }
                }
            Text(order.isShipped ? "Order shipped" : "To be shipped")
            Spacer()
        }
        .padding()
    }
    
    var shipOrderAlert: Alert {
        Alert(
            title: Text("Ship Order"),
            message: Text("Are you sure you want to ship the order? You can't edit the order after!"),
            primaryButton: .default(Text("Ship Order")) {
                orderVM.shipOrder(order: order, viewContext: viewContext)
                self.presentationMode.wrappedValue.dismiss()
            },
            secondaryButton: .cancel(Text("Cancel"))
        )
    }
}
