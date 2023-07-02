//
//  NoAccountButton.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct NoAccountButton: View {
    var body: some View {
        HStack {
            Spacer()
            NavigationLink(destination: Registration()) {
                Text("No account? Register here!")
            }
            .padding()
        }
    }
}

