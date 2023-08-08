//
//  InvoiceRow.swift
//  OnlineStore
//
//  Created by Maximilian Le on 08.08.23.
//

import SwiftUI

struct InvoiceRow: View {
    let text: String
    let figureString: String
    
    var body: some View {
        HStack {
            Text(text)
                .foregroundColor(.secondary)
            Spacer()
            Text("\(figureString)€")
                .foregroundColor(.secondary)
        }
        .padding(.horizontal)
    }
}
