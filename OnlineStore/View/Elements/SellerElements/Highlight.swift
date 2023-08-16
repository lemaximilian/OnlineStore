//
//  Highlight.swift
//  OnlineStore
//
//  Created by Maximilian Le on 04.07.23.
//

import SwiftUI

struct Highlight: View {
    @FocusState var focusedHighlight: Bool
    @Binding var highlight: String
    
    var body: some View {
        TextEditor(text: $highlight)
            .font(.title)
            .bold()
            .frame(maxHeight: 50)
            .padding(.horizontal)
            .focused($focusedHighlight)
            .onTapGesture {
                DispatchQueue.main.asyncAfter(deadline:  .now() + 0.5) {
                    focusedHighlight = true
                }
            }
            .onChange(of: highlight, perform: { newValue in
                highlight = newValue
            })
        
        Spacer()
    }
}
