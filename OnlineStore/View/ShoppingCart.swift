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
        VStack {
            HStack {
                Text("Shopping Cart")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            .padding()
            
            HStack {
                Text("\(placeholderVM.placeholder.count) Products")
                Spacer()
            }
            .padding(.horizontal)
            
            ScrollView(showsIndicators: false) {
                ForEach(placeholderVM.placeholder) { placeholder in
                    ShoppingCartItem(title: placeholder.title)
                }
            }
        }
        .padding()
    }
}

struct ShoppingCart_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCart().environmentObject(PlaceholderViewModel())
    }
}
