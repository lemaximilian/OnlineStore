//
//  Home.swift
//  OnlineStore
//
//  Created by Maximilian Le on 31.05.23.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    
    var body: some View {
        VStack {
            // Welcome message
            HStack {
                Text("Welcome user!")
                    .font(.largeTitle)
                    .bold()
                
                Spacer()
            }
            .padding()
            
            ScrollView(showsIndicators: false) {
                // Top products
                Text("Top Products")
                    .font(.title2)
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                    ForEach(placeholderVM.placeholder) { placeholder in
                        NavigationLink(destination: Home()) {
                            Product(title: placeholder.title)
                        }
                        .buttonStyle(.plain)
                    }
                }
                
                // Categories
                Text("Categories")
                    .font(.title2)
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                    ForEach(placeholderVM.placeholder) { placeholder in
                        NavigationLink(destination: Home()) {
                            ProductRound(title: placeholder.title)
                        }
                        .buttonStyle(.plain)
                    }
                }
                
            }
        }
        .padding()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(PlaceholderViewModel())
    }
}
