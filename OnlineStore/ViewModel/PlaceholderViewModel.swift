//
//  PlaceholderViewModel.swift
//  OnlineStore
//
//  Created by Maximilian Le on 25.05.23.
//

import SwiftUI

class PlaceholderViewModel: ObservableObject {
    @Published var placeholder: [Placeholder]
    
    init() {
        self.placeholder = [
            Placeholder(id: UUID(), title: "iPhone 14"),
            Placeholder(id: UUID(), title: "Nintendo Switch"),
            Placeholder(id: UUID(), title: "Samsung Galaxy S23"),
            Placeholder(id: UUID(), title: "Bose QuietComfort 45"),
            Placeholder(id: UUID(), title: "Dyson Staubsauger"),
            Placeholder(id: UUID(), title: "Bosch Waschmaschine")
        ]
    }
    
}


