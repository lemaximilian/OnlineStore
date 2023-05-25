//
//  ContentView.swift
//  OnlineStore
//
//  Created by Maximilian Le on 25.05.23.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        Text("Hello World!")
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
