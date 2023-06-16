//
//  ProductPage.swift
//  OnlineStore
//
//  Created by Maximilian Le on 14.06.23.
//

import SwiftUI

struct ProductPage: View {
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    @State var selection = ""
    @State var showAlert = false
    var text = exampleText
    var currentPlaceholder: Placeholder
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                
                // Images
                Group {
                    TabView {
                        ForEach(placeholderVM.placeholder) { image in
                            PlaceholderImage()
                                .aspectRatio(1, contentMode: .fit)
                        }
                    }
                    .tabViewStyle(.page)
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                    .frame(minHeight: 475)
                }
                
                
                // Price
                Group {
                    HStack {
                        Spacer()
                        Text("Price: 119.99€")
                            .font(.title2)
                            .bold()
                    }
                    .padding()
                    
                    Divider()
                }
                
                // Description
                Group {
                    HStack {
                        Text("Description")
                            .font(.title2)
                        Spacer()
                    }
                    .padding()
            
                    
                    Text(text)
                        .padding(.horizontal)
                    
                    Divider()
                }
                
                // Highlights
                Group {
                    HStack {
                        Text("Highlights")
                            .font(.title2)
                        Spacer()
                    }
                    .padding()
                    
                    ForEach(placeholderVM.placeholder) { highlight in
                        HStack {
                            Text(highlight.title + ": ")
                            Text(highlight.title)
                            Spacer()
                        }
                        .padding(.horizontal)
                        Divider()
                    }
                }
                
                // Reviews
                Group {
                    HStack {
                        Text("Reviews")
                            .font(.title2)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    HStack {
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Spacer()
                    }
                    .padding()
                    
                    Text(text)
                        .padding(.horizontal)
                    
                    Divider()
                    
                    HStack {
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star")
                        Image(systemName: "star")
                        Spacer()
                    }
                    .padding()
                    
                    Text(text)
                        .padding(.horizontal)
                    
                    Divider()
                    
                    HStack {
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.leadinghalf.filled")
                        Spacer()
                    }
                    .padding()
                    
                    Text(text)
                        .padding(.horizontal)
                }
                
                
                
            }
            .navigationTitle(currentPlaceholder.title)
            .padding()
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button {
                            placeholderVM.addToShoppingCart(currentPlaceholder)
                            showAlert = true
                        } label: {
                            HStack {
                                Image(systemName: "cart")
                                Text("Add to Shopping Cart")
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        .padding(.top)
                        .alert("Added to Shopping Cart", isPresented: $showAlert) {
                                    Button("OK", role: .cancel) { }
                        }
                        
                        Button {
                            // Set as favourite
                        } label: {
                            Image(systemName: "heart")
                        }
                        .buttonStyle(.borderedProminent)
                        .padding(.top)
                    }
                }
            }
        }
    }
}

//struct ProductPage_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductPage().environmentObject(PlaceholderViewModel())
//    }
//}
