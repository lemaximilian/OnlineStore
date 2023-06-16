//
//  PlaceholderViewModel.swift
//  OnlineStore
//
//  Created by Maximilian Le on 25.05.23.
//

import SwiftUI

class PlaceholderViewModel: ObservableObject {
    @Published var placeholder: [Placeholder]
    @Published var shoppingCart: [Placeholder] = []
    
    init() {
        self.placeholder = [
            Placeholder(id: UUID(), title: "Placeholder #1"),
            Placeholder(id: UUID(), title: "Placeholder #2"),
            Placeholder(id: UUID(), title: "Placeholder #3"),
            Placeholder(id: UUID(), title: "Placeholder #4"),
            Placeholder(id: UUID(), title: "Placeholder #5"),
            Placeholder(id: UUID(), title: "Placeholder #6")
        ]
    }
    
    func addToShoppingCart(_ item: Placeholder) {
        shoppingCart.append(item)
    }
}


