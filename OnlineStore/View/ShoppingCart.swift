//
//  ShoppingCart.swift
//  OnlineStore
//
//  Created by Maximilian Le on 31.05.23.
//

import SwiftUI

struct ShoppingCart: View {
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    @State var showAlert = false
    
    var body: some View {
        if placeholderVM.shoppingCart.isEmpty {
            Text("Shopping Cart is empty")
                .navigationTitle("Shopping Cart")
                .padding()
        } else {
            ScrollView(showsIndicators: false) {
                HStack {
                    Text("\(placeholderVM.shoppingCart.count) Products")
                    Spacer()
                }
                .padding(.horizontal)
                
                ForEach(placeholderVM.shoppingCart) { placeholder in
                    ShoppingCartItem(title: placeholder.title)
                    Divider()
                }
            }
            .navigationTitle("Shopping Cart")
            .padding()
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        showAlert = true
                    } label: {
                        HStack {
                            Image(systemName: "eurosign")
                            Text("Purchase")
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                    .alert("Purchased successfully!", isPresented: $showAlert) {
                                Button("OK", role: .cancel) { }
                    }
                }
            }
        }
    }
}

struct ShoppingCart_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCart().environmentObject(PlaceholderViewModel())
    }
}
