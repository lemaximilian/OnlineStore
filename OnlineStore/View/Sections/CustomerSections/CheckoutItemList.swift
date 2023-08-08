//
//  CheckoutItemList.swift
//  OnlineStore
//
//  Created by Maximilian Le on 08.08.23.
//

import SwiftUI

struct CheckoutItemList: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var productVM: ProductViewModel
    
    var body: some View {
        ForEach(Array(userVM.currentUser.shoppingCart)) { product in
            CheckoutItem(product: product, image: productVM.fetchProductImages(product: product, viewContext: viewContext).first)
            Divider()
                .padding(.horizontal)
        }
    }
}
