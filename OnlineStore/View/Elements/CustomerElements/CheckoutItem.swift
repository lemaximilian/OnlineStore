//
//  CheckoutItem.swift
//  OnlineStore
//
//  Created by Maximilian Le on 31.07.23.
//

import SwiftUI

struct CheckoutItem: View {
    @EnvironmentObject var appVM: AppViewModel
    var product: Product
    var image: Data?
    
    var body: some View {
        ZStack {
            HStack {
                if let image,
                   let uiImage = UIImage(data: image) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 75, height: 75)
                        .padding()
                }
                
                VStack {
                    HStack {
                        Text(product.title ?? "Unknown Product")
                            .font(.footnote)
                            .bold()
                        Spacer()
                    }
                    
                    HStack {
                        Text("Price: \(appVM.numberFormatterDecimal.string(from: NSNumber(value: product.price)) ?? "")€")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                }
                
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}


