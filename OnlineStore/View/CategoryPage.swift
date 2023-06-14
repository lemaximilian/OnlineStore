//
//  CategoryPage.swift
//  OnlineStore
//
//  Created by Maximilian Le on 14.06.23.
//

import SwiftUI

struct CategoryPage: View {
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                    ForEach(placeholderVM.placeholder) { product in
                        NavigationLink(destination: ProductPage()) {
                            ProductRectangle(title: product.title)
                        }
                        .buttonStyle(.plain)
                    }
                    
                }
            }
            .navigationTitle("Category")
            .padding()
        }
    }
}

struct CategoryPage_Previews: PreviewProvider {
    static var previews: some View {
        CategoryPage().environmentObject(PlaceholderViewModel())
    }
}
