//
//  RequestFields.swift
//  OnlineStore
//
//  Created by Maximilian Le on 16.08.23.
//

import SwiftUI

struct RequestFields: View {
    @Binding var subject: String
    @Binding var request: String
    
    var body: some View {
        Text("Subject")
            .bold()
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
        TextField("Enter subject...", text: $subject)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
            .padding(.bottom)
        Text("Request")
            .bold()
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
        TextField("Enter your request...", text: $request, axis: .vertical)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
    }
}


