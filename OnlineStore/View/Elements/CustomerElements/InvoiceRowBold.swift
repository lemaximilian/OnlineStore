//
//  InvoiceRowBold.swift
//  OnlineStore
//
//  Created by Maximilian Le on 08.08.23.
//

import SwiftUI

struct InvoiceRowBold: View {
    let text: String
    let figureString: String
    
    var body: some View {
        HStack {
            Text("Total:")
                .font(.title3)
                .bold()
            Spacer()
            Text("\(figureString)€")
                .font(.title3)
                .bold()
        }
        .padding(.horizontal)
    }
}

