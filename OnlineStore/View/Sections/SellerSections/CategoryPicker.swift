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
    @Binding var selectedCategory: Category
    
    var body: some View {
        Picker("Category", selection: $selectedCategory) {
            ForEach(categories, id: \.self) { category in
                Text(category.title ?? "Unknown Category")
                    .onTapGesture {
                        selectedCategory = category
                    }
            }
        }
        .pickerStyle(.navigationLink)
        .padding()
    }
}


