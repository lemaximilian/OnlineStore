//
//  ProductFields.swift
//  OnlineStore
//
//  Created by Maximilian Le on 04.07.23.
//

import SwiftUI

struct ProductFields: View {
    @Binding var title: String
    @Binding var price: Float
    @Binding var description: String
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        TextField("Title", text: $title)
            .textFieldStyle(.roundedBorder)
            .padding()
        
        HStack {
            TextField("Price", value: $price, formatter: formatter)
                .textFieldStyle(.roundedBorder)
                .padding()
            Text("€")
        }
        
        
        TextField("Description", text: $description, axis: .vertical)
            .textFieldStyle(.roundedBorder)
            .padding()
    }
}


