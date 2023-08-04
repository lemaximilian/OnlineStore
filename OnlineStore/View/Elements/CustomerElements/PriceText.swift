//
//  PriceText.swift
//  OnlineStore
//
//  Created by Maximilian Le on 02.07.23.
//

import SwiftUI

struct PriceText: View {
    @EnvironmentObject var appVM: AppViewModel
    var price: Float
    
    var body: some View {
        HStack {
            Spacer()
            Text("Price: \(appVM.numberFormatter.string(from: NSNumber(value: price)) ?? "")€")
                .font(.title2)
                .bold()
        }
        .padding()
    }
}

