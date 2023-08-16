//
//  SettingsList.swift
//  OnlineStore
//
//  Created by Maximilian Le on 16.08.23.
//

import SwiftUI

struct SettingsList: View {
    var body: some View {
        List {
            Section("Help") {
                NavigationLink(destination: SupportRequest()) {
                    Text("Request Support")
                }
            }
        }
        .listStyle(.plain)
    }
}


