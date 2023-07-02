//
//  HomeTab.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct HomeTab: View {
    var body: some View {
        NavigationStack {
            Home()
        }
        .tabItem {
            Image(systemName: "house")
            Text("Home")
        }
        .tag(Tab.home)
    }
}


