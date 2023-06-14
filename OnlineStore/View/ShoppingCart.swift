//
//  ShoppingCart.swift
//  OnlineStore
//
//  Created by Maximilian Le on 31.05.23.
//

import SwiftUI

struct ShoppingCart: View {
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                HStack {
                    Text("\(placeholderVM.placeholder.count) Products")
                    Spacer()
                }
                .padding(.horizontal)
                
                ForEach(placeholderVM.placeholder) { placeholder in
                    ShoppingCartItem(title: placeholder.title)
                    Divider()
                }
            }
            .navigationTitle("Shopping Cart")
            .padding()
        }
    }
}

struct ShoppingCart_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCart().environmentObject(PlaceholderViewModel())
    }
}
