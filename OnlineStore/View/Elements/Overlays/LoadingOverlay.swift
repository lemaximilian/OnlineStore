//
//  LoadingOverlay.swift
//  OnlineStore
//
//  Created by Maximilian Le on 28.06.23.
//

import SwiftUI

struct LoadingOverlay: View {
    @Binding var isLoading: Bool
    var title: String
    
    var body: some View {
        if isLoading {
            ProgressView(title)
                .frame(width: 100, height: 100)
                .background(.white)
                .cornerRadius(20)
                .shadow(radius: 5)
        }
    }
}
