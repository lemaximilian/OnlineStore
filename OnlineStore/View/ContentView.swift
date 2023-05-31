//
//  ContentView.swift
//  OnlineStore
//
//  Created by Maximilian Le on 25.05.23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    
    var body: some View {
        TabController()
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PlaceholderViewModel())
    }
}
