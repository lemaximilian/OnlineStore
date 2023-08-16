//
//  OpenTickets.swift
//  OnlineStore
//
//  Created by Maximilian Le on 15.08.23.
//

import SwiftUI

struct OpenTickets: View {
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "isProcessed == %@", "0")) private var openTickets: FetchedResults<Ticket>
    
    var body: some View {
        if openTickets.isEmpty {
            Text("There are currently no open requests")
        } else {
            TicketsList(tickets: openTickets)
        }
    }
}

