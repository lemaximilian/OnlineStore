//
//  Categories.swift
//  OnlineStore
//
//  Created by Maximilian Le on 31.05.23.
//

import SwiftUI

struct Categories: View {
    @EnvironmentObject var placeholderVM: PlaceholderViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Categories")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            .padding()
            
            ScrollView(showsIndicators: false) {
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

struct Categories_Previews: PreviewProvider {
    static var previews: some View {
        Categories().environmentObject(PlaceholderViewModel())
    }
}
