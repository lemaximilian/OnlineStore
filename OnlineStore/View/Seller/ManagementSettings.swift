//
//  ManagementSettings.swift
//  OnlineStore
//
//  Created by Maximilian Le on 15.08.23.
//

import SwiftUI

struct ManagementSettings: View {
    @EnvironmentObject var appVM: AppViewModel
    
    var body: some View {
        LogoutButton()
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .disabled(appVM.isLoading)
            .blur(radius: appVM.isLoading ? 3 : 0)
            .overlay(LoadingOverlay(isLoading: $appVM.isLoading, title: "Logging out"))
            .transition(.move(edge: .leading))
    }
}


