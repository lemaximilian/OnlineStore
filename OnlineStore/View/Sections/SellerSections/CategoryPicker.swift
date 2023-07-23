//
//  CategoryPicker.swift
//  OnlineStore
//
//  Created by Maximilian Le on 04.07.23.
//

import SwiftUI

struct CategoryPicker: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.order)]) private var categories: FetchedResults<Category>
    @State private var selectedCategoryName = "Smartphones"
    @Binding var selectedCategory: Category
    
    var body: some View {
        Picker("Category", selection: $selectedCategoryName) {
            ForEach(categories, id: \.title) { category in
                Text(category.title ?? "Unknown Category")
                    .onTapGesture {
                        selectedCategory = category
                    }
            }
        }
        .pickerStyle(.navigationLink)
        .padding()
        .onAppear {
            selectedCategory = categories.first ?? Category(context: viewContext)
        }
    }
}


