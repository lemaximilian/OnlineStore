//
//  ProductFields.swift
//  OnlineStore
//
//  Created by Maximilian Le on 04.07.23.
//

import SwiftUI

struct ProductFields: View {
    @Binding var title: String
    @Binding var description: String
    
    var body: some View {
        TextField("Title", text: $title)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        
        TextField("Description", text: $description, axis: .vertical)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}


