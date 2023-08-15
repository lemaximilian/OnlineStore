//
//  LogoutButton.swift
//  OnlineStore
//
//  Created by Maximilian Le on 29.06.23.
//

import SwiftUI

struct LogoutButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var appVM: AppViewModel
    @EnvironmentObject var notificationVM: NotificationViewModel
    
    var body: some View {
        Button("Logout", role: .destructive) {
            withAnimation {
                notificationVM.unsubscribeNotification()
                appVM.isLoading = true
            }
            appVM.logout()
        }
        .buttonStyle(.borderedProminent)
        .padding()
    }
}

