//
//  ProductFields.swift
//  OnlineStore
//
//  Created by Maximilian Le on 04.07.23.
//

import SwiftUI

struct ProductFields: View {
    @EnvironmentObject var appVM: AppViewModel
    @Binding var title: String
    @Binding var price: Float
    @Binding var description: String
    
    var body: some View {
        TextField("Title", text: $title)
            .textFieldStyle(.roundedBorder)
            .padding()
        
        HStack {
            TextField("Price", value: $price, formatter: appVM.formatter)
                .textFieldStyle(.roundedBorder)
                .padding()
            Text("€")
        }
        
        
        TextField("Description", text: $description, axis: .vertical)
            .textFieldStyle(.roundedBorder)
            .padding()
    }
}


