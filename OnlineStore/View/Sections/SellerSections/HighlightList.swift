//
//  HighlightList.swift
//  OnlineStore
//
//  Created by Maximilian Le on 04.07.23.
//

import SwiftUI

struct HighlightList: View {
    @Binding var highlightArray: [String]
    @State private var highlightCounter = 1
    
    var body: some View {
        List {
            Section("Highlights") {
                ForEach($highlightArray, id: \.self) { highlight in
                    NavigationLink(destination: Highlight(highlight: highlight)) {
                        Text(highlight.wrappedValue)
                    }
                }
                Button(action: {
                    withAnimation {
                        highlightArray.append("New Highlight #\(highlightCounter)")
                    }
                    highlightCounter += 1
                }) {
                    HStack {
                        Image(systemName: "plus")
                        Text("Add Highlight")
                    }
                    .foregroundColor(.blue)
                }
            }
        }
        .listStyle(.plain)
        .frame(minHeight: CGFloat(highlightArray.count * 50) + 100)

    }
}

