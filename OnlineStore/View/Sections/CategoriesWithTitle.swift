//
//  CategoriesWithTitle.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct CategoriesWithTitle: View {
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
        
        CategoryGrid()
    }
}

