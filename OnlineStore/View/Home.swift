//
//  Home.swift
//  OnlineStore
//
//  Created by Maximilian Le on 31.05.23.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                // Top products
                Text("Top Products")
                    .font(.title2)
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                    ForEach(placeholderVM.placeholder) { placeholder in
                        NavigationLink(destination: ProductPage(currentPlaceholder: placeholder)) {
                            ProductRectangle(title: placeholder.title)
                        }
                        .buttonStyle(.plain)
                    }
                }
                
                Divider()
                
                // Categories
                Text("Categories")
                    .font(.title2)
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                    ForEach(placeholderVM.placeholder) { placeholder in
                        NavigationLink(destination: CategoryPage()) {
                            ProductRound(title: placeholder.title)
                        }
                        .buttonStyle(.plain)
                    }
                }
                
            }
            .navigationTitle("Welcome user!")
            .navigationBarTitleDisplayMode(.large)
            .padding()
        }
        .searchable(text: $searchText) {
            ForEach(searchResults, id: \.self) { result in
                Text(result).searchCompletion(result)
            }
        }
    }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return placeholderVM.placeholder.map { $0.title }
        } else {
            return placeholderVM.placeholder.map { $0.title } .filter { $0.contains(searchText) }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(PlaceholderViewModel())
    }
}
