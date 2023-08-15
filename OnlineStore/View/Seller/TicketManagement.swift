//
//  TicketManagement.swift
//  OnlineStore
//
//  Created by Maximilian Le on 15.08.23.
//

import SwiftUI

struct TicketManagement: View {
    @State var selectedSegment = "open"
    
    var body: some View {
        VStack {
            Picker("", selection: $selectedSegment) {
                Text("Open Tickets").tag("open")
                Text("Processed Tickets").tag("processed")
            }
            .pickerStyle(.segmented)
            .padding()
            
            Spacer()
            
            HStack {
                if selectedSegment == "open" {
                    OpenTickets()
                } else {
                    ProcessedTickets()
                }
            }
            
            Spacer()
        }
        .navigationTitle("Support Tickets")
        .padding()
    }
}

