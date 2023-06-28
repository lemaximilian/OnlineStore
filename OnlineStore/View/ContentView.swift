//
//  ContentView.swift
//  OnlineStore
//
//  Created by Maximilian Le on 25.05.23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    @EnvironmentObject var appVM: AppViewModel
    
    var body: some View {
        if !appVM.isLoggedIn {
            Registration()
                .transition(.move(edge: .trailing))
        } else {
            TabController()
                .transition(.move(edge: .trailing))
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PlaceholderViewModel())
            .environmentObject(AppViewModel())
    }
}
