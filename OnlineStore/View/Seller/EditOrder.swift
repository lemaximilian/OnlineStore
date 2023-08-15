//
//  EditOrder.swift
//  OnlineStore
//
//  Created by Maximilian Le on 14.08.23.
//

import SwiftUI

struct EditOrder: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var productVM: ProductViewModel
    @EnvironmentObject var orderVM: OrderViewModel
    @State var showAlert = false
    @State var order: Order
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(Array(order.products)) { product in
                CheckoutItem(product: product, image: productVM.fetchProductImages(product: product, viewContext: viewContext).first)
                Divider()
                    .padding(.horizontal)
            }
            
            InvoiceFields(checkedShipping: getShippingBool(), total: order.total)
            
            ShippingInformation(fullName: $order.unwrappedFullName, address: $order.unwrappedAddress, postcode: $order.postcode, city: $order.unwrappedCity)
            
            Group {
                HStack {
                    Text("Shipping")
                        .font(.title3)
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
                
                Divider()
                    .padding(.horizontal)
            }
            
            Group {
                HStack {
                    Text("Shipping Status")
                        .font(.title3)
                        .bold()
                    Spacer()
                }
                .padding(.horizontal)
                
                HStack {
                    Image(systemName: order.isShipped ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(order.isShipped ? .secondary : .primary)
                        .alert(isPresented: $showAlert) {
                            shipOrderAlert
                        }
                        .onTapGesture {
                            if !(order.isShipped) {
                                showAlert = true
                            }
                        }
                    Text(order.isShipped ? "Order shipped" : "To be shipped")
                    Spacer()
                }
                .padding()
            }
        }
        
        EditOrderButton(
            fullName: $order.unwrappedFullName,
            address: $order.unwrappedAddress,
            postcode: $order.postcode,
            city: $order.unwrappedCity,
            order: order
        )
    }
    
    var shipOrderAlert: Alert {
        Alert(
            title: Text("Ship Order"),
            message: Text("Are you sure you want to ship the order?"),
            primaryButton: .default(Text("Ship Order")) {
                orderVM.shipOrder(order: order, viewContext: viewContext)
                self.presentationMode.wrappedValue.dismiss()
            },
            secondaryButton: .cancel(Text("Cancel"))
        )
    }
    
    func getShippingBool() -> Binding<Bool> {
        var shippingBool = true
        if order.shipping == "Standard" {
            shippingBool = true
        } else {
            shippingBool = false
        }
        return Binding(get: { shippingBool }, set: { shippingBool = $0 })
    }
}


