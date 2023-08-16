//
//  SupportRequest.swift
//  OnlineStore
//
//  Created by Maximilian Le on 14.08.23.
//

import SwiftUI

struct SupportRequest: View {
    @State var showAlert = false
    @State var activeAlert: ActiveAlert = .first
    @State var subject: String = ""
    @State var request: String = ""
    
    var body: some View {
        VStack {
            RequestFields(subject: $subject, request: $request)
            
            SubmitRequestButton(
                subject: subject,
                request: request,
                showAlert: $showAlert,
                activeAlert: $activeAlert
            )
        }
        .navigationTitle("Request Support")
        .padding()
    }
    
    
}


