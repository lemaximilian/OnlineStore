//
//  CheckoutButton.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct CheckoutButton: View {
    @EnvironmentObject var notificationVM: NotificationViewModel
    @State var showingPopover: Bool = false
    
    var body: some View {
        Button {
            notificationVM.subscribeNotifications()
            showingPopover = true
        } label: {
            HStack {
                Image(systemName: "bag.fill")
                Text("Checkout")
            }
        }
        .buttonStyle(.borderedProminent)
        .padding()
        .popover(isPresented: $showingPopover) {
            Checkout(showingPopover: $showingPopover)
        }
//        Button {
//            showAlert = true
//        } label: {
//            HStack {
//                Image(systemName: "eurosign")
//                Text("Purchase")
//            }
//        }
//        .buttonStyle(.borderedProminent)
//        .padding()
//        .alert("Purchased successfully!", isPresented: $showAlert) {
//                    Button("OK", role: .cancel) { }
//        }
    }
}

