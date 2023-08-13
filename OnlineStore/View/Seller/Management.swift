//
//  Management.swift
//  OnlineStore
//
//  Created by Maximilian Le on 07.06.23.
//

import SwiftUI

struct Management: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\.order)]) private var categories: FetchedResults<Category>
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    @EnvironmentObject var appVM: AppViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                    NavigationLink(destination: NewProduct(selectedCategory: categories.first ?? Category())) {
                        RectangleButton(title: "New Product", image: "plus")
                    }
                    .buttonStyle(.plain)
                    
                    NavigationLink(destination: ProductManagement()) {
                        RectangleButton(title: "Edit Product", image: "pencil")
                    }
                    .buttonStyle(.plain)
                    
                    NavigationLink(destination: UserManagement()) {
                        RectangleButton(title: "User Management", image: "person.fill")
                    }
                    .buttonStyle(.plain)
                    
                    NavigationLink(destination: NewCategory()) {
                        RectangleButton(title: "New Category", image: "bag.fill.badge.plus")
                    }
                    .buttonStyle(.plain)
                    
                    NavigationLink(destination: NewCategory()) {
                        RectangleButton(title: "Support Requests", image: "person.fill.questionmark")
                    }
                    .buttonStyle(.plain)
                    
                    NavigationLink(destination: LogoutButton()) {
                        RectangleButton(title: "Settings", image: "gearshape.fill")
                    }
                    .buttonStyle(.plain)
                }
                
                Spacer()
            }
            .navigationTitle("Manage Store")
            .navigationBarTitleDisplayMode(.large)
            .padding()
        }
    }
}

