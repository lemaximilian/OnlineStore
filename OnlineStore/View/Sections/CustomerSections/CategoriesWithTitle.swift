//
//  CategoriesWithTitle.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct CategoriesWithTitle: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
        
        CategoryGrid()
    }
}

