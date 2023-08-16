//
//  AddReviewFields.swift
//  OnlineStore
//
//  Created by Maximilian Le on 16.08.23.
//

import SwiftUI

struct AddReviewFields: View {
    @Binding var title: String
    @Binding var comment: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Title")
                .bold()
            TextField("Title of your Review", text: $title)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom)
            Text("Comment")
                .bold()
            TextField("Comment for the Product", text: $comment, axis: .vertical)
                .textFieldStyle(.roundedBorder)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

