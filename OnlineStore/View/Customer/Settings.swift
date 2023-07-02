//
//  Settings.swift
//  OnlineStore
//
//  Created by Maximilian Le on 31.05.23.
//

import SwiftUI

struct Settings: View {
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    
    var body: some View {
        List {
            Section("User Settings") {
                ForEach(placeholderVM.placeholder) { setting in
                    NavigationLink(destination: Settings()) {
                        Text(setting.title)
                    }
                }
            }
            Section("Appearance") {
                ForEach(placeholderVM.placeholder) { setting in
                    NavigationLink(destination: Settings()) {
                        Text(setting.title)
                    }
                }
            }
            Section("Privacy Settings") {
                ForEach(placeholderVM.placeholder) { setting in
                    NavigationLink(destination: Settings()) {
                        Text(setting.title)
                    }
                }
            }
        }
        .navigationTitle("Settings")
        .listStyle(.plain)
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings().environmentObject(PlaceholderViewModel())
    }
}
