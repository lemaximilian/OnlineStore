//
//  EditProduct.swift
//  OnlineStore
//
//  Created by Maximilian Le on 12.06.23.
//

import SwiftUI

struct EditProduct: View {
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    
    var body: some View {
        List {
            ForEach(placeholderVM.placeholder) { product in
                NavigationLink(destination: EditProduct()) {
                    Text(product.title)
                }
            }
        }
        .navigationTitle("Edit Product")
    }
}

struct EditProduct_Previews: PreviewProvider {
    static var previews: some View {
        EditProduct().environmentObject(PlaceholderViewModel())
    }
}
