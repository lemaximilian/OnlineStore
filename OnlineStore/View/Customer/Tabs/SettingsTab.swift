//
//  SettingsTab.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct SettingsTab: View {
    var body: some View {
        NavigationStack {
            LogoutButton()
        }
        .tabItem {
            Image(systemName: "gearshape")
            Text("Settings")
        }
        .tag(Tab.settings)
    }
}
