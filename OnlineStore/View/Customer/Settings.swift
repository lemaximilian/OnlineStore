//
//  Settings.swift
//  OnlineStore
//
//  Created by Maximilian Le on 31.05.23.
//

import SwiftUI

struct Settings: View {
    @EnvironmentObject var appVM: AppViewModel
    
    var body: some View {
        VStack {
            SettingsList()
            
            LogoutButton()
            
            Spacer()
        }
        .navigationTitle("Settings")
        // modifiers for loading overlay
        .disabled(appVM.isLoading)
        .blur(radius: appVM.isLoading ? 3 : 0)
        .overlay(LoadingOverlay(isLoading: $appVM.isLoading, title: "Logging out"))
        .transition(.move(edge: .leading))
    }
}

