//
//  EditProduct.swift
//  OnlineStore
//
//  Created by Maximilian Le on 12.06.23.
//

import SwiftUI

struct EditProduct: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var productVM: ProductViewModel
    @FetchRequest(sortDescriptors: []) private var products: FetchedResults<Product>
    
    var body: some View {
        List {
            ForEach(productVM.products) { product in
                NavigationLink(destination: EditProduct()) {
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
