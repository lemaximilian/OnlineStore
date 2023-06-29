//
//  Logout.swift
//  OnlineStore
//
//  Created by Maximilian Le on 29.06.23.
//

import SwiftUI

struct Logout: View {
    @EnvironmentObject var appVM: AppViewModel
    
    var body: some View {
        Button("Logout", role: .destructive) {
            withAnimation {
                appVM.isLoading = true
            }
            appVM.logout()
        }
        .buttonStyle(.borderedProminent)
        .disabled(appVM.isLoading)
        .blur(radius: appVM.isLoading ? 3 : 0)
        .overlay(LoadingOverlay(isLoading: $appVM.isLoading, title: "Logging out"))
        .padding()
    }
}


