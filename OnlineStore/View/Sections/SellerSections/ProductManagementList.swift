//
//  ProductManagementList.swift
//  OnlineStore
//
//  Created by Maximilian Le on 16.08.23.
//

import SwiftUI

struct ProductManagementList: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var productVM: ProductViewModel
    @FetchRequest(sortDescriptors: []) private var products: FetchedResults<Product>
    
    var body: some View {
        List {
            ForEach(productVM.products) { product in
                NavigationLink(destination: EditProduct(product: product)) {
                    Text(product.unwrappedTitle)
                }
            }
            .onDelete(perform: { indexSet in
                productVM.removeProduct(at: indexSet, products: products, viewContext: viewContext)
            })
        }
        .navigationTitle("Edit Product")
        .toolbar {
            EditButton()
        }

    }
}

