//
//  ExistingAccountButton.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct ExistingAccountButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        HStack {
            Spacer()
            Button("Login with an existing account") {
                self.presentationMode.wrappedValue.dismiss()
            }
            .padding()
        }
    }
}
