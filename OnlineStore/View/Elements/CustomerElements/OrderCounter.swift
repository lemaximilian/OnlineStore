//
//  OrderCounter.swift
//  OnlineStore
//
//  Created by Maximilian Le on 08.08.23.
//

import SwiftUI

struct OrderCounter: View {
    let orderCount: Int
    
    var body: some View {
        HStack {
            Text("\(orderCount) Orders")
            Spacer()
        }
        .padding(.horizontal)
    }
}


