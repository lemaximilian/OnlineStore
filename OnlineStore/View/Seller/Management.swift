//
//  Management.swift
//  OnlineStore
//
//  Created by Maximilian Le on 07.06.23.
//

import SwiftUI

struct Management: View {
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    @EnvironmentObject var appVM: AppViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                    NavigationLink(destination: NewProduct()) {
                        RectangleButton(title: "New Product", image: "plus")
                    }
                    .buttonStyle(.plain)
                    
                    NavigationLink(destination: EditProduct()) {
                        RectangleButton(title: "Edit Product", image: "pencil")
                    }
                    .buttonStyle(.plain)
                    
                    NavigationLink(destination: NewCategory()) {
                        RectangleButton(title: "Support Requests", image: "person.fill")
                    }
                    .buttonStyle(.plain)
                    
                    NavigationLink(destination: LogoutButton()) {
                        RectangleButton(title: "Settings", image: "gearshape.fill")
                    }
                    .buttonStyle(.plain)
                }
                
                Spacer()
            }
            .navigationTitle("Manage Store")
            .navigationBarTitleDisplayMode(.large)
            .padding()
        }
    }
}

struct Management_Previews: PreviewProvider {
    static var previews: some View {
        Management()
            .environmentObject(PlaceholderViewModel())
    }
}
