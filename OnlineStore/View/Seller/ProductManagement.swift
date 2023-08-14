//
//  EditProduct.swift
//  OnlineStore
//
//  Created by Maximilian Le on 12.06.23.
//

import SwiftUI

struct ProductManagement: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var productVM: ProductViewModel
    @FetchRequest(sortDescriptors: []) private var products: FetchedResults<Product>
    
    var body: some View {
        if productVM.products.isEmpty {
            Text("There are currently no products")
                .navigationTitle("Edit Product")
        } else {
            List {
                ForEach(productVM.products) { product in
                    NavigationLink(destination: EditProduct(product: product)) {
                        Text(product.title ?? "Unknown Title")
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
}
