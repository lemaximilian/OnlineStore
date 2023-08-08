//
//  ShoppingCartTotal.swift
//  OnlineStore
//
//  Created by Maximilian Le on 08.08.23.
//

import SwiftUI

struct ShoppingCartTotal: View {
    let totalString: String
    
    var body: some View {
        HStack {
            Spacer()
            Text("Total: \(totalString)€")
                .font(.title)
                .bold()
        }
    }
}

