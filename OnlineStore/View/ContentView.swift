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
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        switch appVM.isLoggedIn {
        case .notLoggedIn:
            Login()
                .transition(.move(edge: .trailing))
        case .loggedInCustomer:
            TabController()
                .transition(.move(edge: .trailing))
        case .loggedInSeller:
            Management()
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
