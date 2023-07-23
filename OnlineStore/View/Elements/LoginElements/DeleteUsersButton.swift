//
//  DeleteUsersButton.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct DeleteUsersButton: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: []) private var users: FetchedResults<User>
    
    var body: some View {
        Button("Delete all Users", role: .destructive) {
            
        }
        .buttonStyle(.borderedProminent)
        .padding()
    }
}
