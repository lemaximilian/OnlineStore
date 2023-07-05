//
//  CategoryPicker.swift
//  OnlineStore
//
//  Created by Maximilian Le on 04.07.23.
//

import SwiftUI

struct CategoryPicker: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\.order)]) private var categories: FetchedResults<Category>
    @Binding var selectedCategoryName: String
    @Binding var selectedCategory: Category
    
    var body: some View {
        Picker("Category", selection: $selectedCategoryName) {
            ForEach(categories, id: \.wrappedTitle) { category in
                Text(category.wrappedTitle)
                    .onTapGesture {
                        selectedCategory = category
                    }
            }
        }
        .pickerStyle(.navigationLink)
        .padding()
    }
}


