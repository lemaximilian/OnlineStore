//
//  Settings.swift
//  OnlineStore
//
//  Created by Maximilian Le on 31.05.23.
//

import SwiftUI

struct Settings: View {
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    @EnvironmentObject var appVM: AppViewModel
    
    var body: some View {
        VStack {
            List {
                Section("Help") {
                    NavigationLink(destination: SupportRequest()) {
                        Text("Request Support")
                    }
                }
            }
            .listStyle(.plain)
            
            LogoutButton()
            
            Spacer()
        }
        .navigationTitle("Settings")
        .disabled(appVM.isLoading)
        .blur(radius: appVM.isLoading ? 3 : 0)
        .overlay(LoadingOverlay(isLoading: $appVM.isLoading, title: "Logging out"))
        .transition(.move(edge: .leading))
    }
}

