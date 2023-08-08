//
//  Categories.swift
//  OnlineStore
//
//  Created by Maximilian Le on 31.05.23.
//

import SwiftUI

struct Categories: View {
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    
    var body: some View {
        CategoryGrid()
            .navigationTitle("Categories")
            .padding()
    }
}
