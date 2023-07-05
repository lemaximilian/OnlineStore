//
//  CategoryPage.swift
//  OnlineStore
//
//  Created by Maximilian Le on 14.06.23.
//

import SwiftUI

struct CategoryPage: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            ProductGrid()
        }
        .navigationTitle("Category")
        .padding()
    }
}

struct CategoryPage_Previews: PreviewProvider {
    static var previews: some View {
        CategoryPage()
    }
}
