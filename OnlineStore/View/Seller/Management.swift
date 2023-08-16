//
//  Management.swift
//  OnlineStore
//
//  Created by Maximilian Le on 07.06.23.
//

import SwiftUI

struct Management: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\.order)]) private var categories: FetchedResults<Category>
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                    NavigationLink(destination: AddProduct(selectedCategory: categories.first ?? Category())) {
                        RectangleButton(title: "Add Product", image: "plus")
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
                    
                    NavigationLink(destination: OrderManagement()) {
                        RectangleButton(title: "Order Management", image: "box.truck.badge.clock.fill")
                    }
                    .buttonStyle(.plain)
                    
                    NavigationLink(destination: AddCategory()) {
                        RectangleButton(title: "Add Category", image: "bag.fill.badge.plus")
                    }
                    .buttonStyle(.plain)
                    
                    NavigationLink(destination: TicketManagement()) {
                        RectangleButton(title: "Support Requests", image: "person.fill.questionmark")
                    }
                    .buttonStyle(.plain)
                    
                    NavigationLink(destination: ManagementSettings()) {
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

