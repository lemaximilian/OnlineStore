//
//  Home.swift
//  OnlineStore
//
//  Created by Maximilian Le on 31.05.23.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    @EnvironmentObject var userVM: UserViewModel
    @State private var searchText = ""
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            // Top products section
            TopProducts(title: "Top Products")
            
            Divider()
            
            // Top categories section
            CategoriesWithTitle(title: "Categories")
            
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.large)
        .padding()
//        NavigationStack {
//
//        }
//        .searchable(text: $searchText) {
//            ForEach(searchResults, id: \.self) { result in
//                Text(result).searchCompletion(result)
//            }
//        }
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
