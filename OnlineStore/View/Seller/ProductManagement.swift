//
//  ProductManagement.swift
//  OnlineStore
//
//  Created by Maximilian Le on 12.06.23.
//

import SwiftUI

struct ProductManagement: View {
    @EnvironmentObject var productVM: ProductViewModel
    
    var body: some View {
        if productVM.products.isEmpty {
            EmptyProduct()
                .navigationTitle("Edit Product")
        } else {
            ProductManagementList()
        }
    }
}
