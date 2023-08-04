//
//  OrderItem.swift
//  OnlineStore
//
//  Created by Maximilian Le on 04.08.23.
//

import SwiftUI

struct OrderItem: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var appVM: AppViewModel
    @EnvironmentObject var productVM: ProductViewModel
    var order: Order
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(Array(order.products)) { product in
                CheckoutItem(product: product, image: productVM.fetchProductImages(product: product, viewContext: viewContext).first)
                Divider()
                    .padding(.horizontal)
            }
            
            Group {
                HStack {
                    Text("Subtotal: ")
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("\(appVM.numberFormatter.string(from: NSNumber(value: calcTotalAmount(order: order) * 0.81)) ?? "")€")
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                
                HStack {
                    Text("Taxes:")
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("\(appVM.numberFormatter.string(from: NSNumber(value: calcTotalAmount(order: order) * 0.19)) ?? "")€")
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                
                Divider()
                    .padding(.horizontal)
                
                HStack {
                    Text("Total:")
                        .font(.title3)
                        .bold()
                    Spacer()
                    Text("\(appVM.numberFormatter.string(from: NSNumber(value: calcTotalAmount(order: order))) ?? "")€")
                        .font(.title3)
                        .bold()
                }
                .padding(.horizontal)
                
                Divider()
                    .padding(.horizontal)
            }
            
            Group {
                HStack {
                    Text("Shipping")
                        .font(.title3)
                        .bold()
                        .bold()
                    Spacer()
                }
                .padding(.horizontal)
                
                HStack {
                    VStack {
                        HStack {
                            Text(order.shipping == "Standard" ? "Standard" : "Express")
                            Spacer()
                        }
                        
                        HStack {
                            Text(order.shipping == "Standard" ? "2-4 business days" : "1 business day")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                            Spacer()
                        }
                        
                    }
                    Spacer()
                    Text(order.shipping == "Standard" ? "Free" : "+4,99€")
                }
                .padding()
                
                Divider()
                    .padding(.horizontal)
            }
            
            Group {
                HStack {
                    Text("Payment")
                        .font(.title3)
                        .bold()
                    Spacer()
                }
                .padding(.horizontal)
                
                HStack {
                    if order.payment == "PayPal" {
                        Image("PayPal")
                            .resizable()
                            .frame(width: 25, height: 25)
                    } else {
                        Image(systemName: "creditcard")
                    }
                    Text(order.payment == "PayPal" ? "PayPal (\(order.user?.mail ?? "Unknown Mail"))" : "Credit Card (●●●●●●●●●●900)")
                    Spacer()
                }
                .padding()
            }
        }
    }
    
    func calcTotalAmount(order: Order) -> Float {
        var total: Float = 0.0
        for product in order.products {
            total += product.price
        }
        return total
    }
}

