//
//  ProcessedRequests.swift
//  OnlineStore
//
//  Created by Maximilian Le on 15.08.23.
//

import SwiftUI

struct ProcessedTickets: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var ticketVM: TicketViewModel
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "isProcessed == %@", "1")) private var processedTickets: FetchedResults<Ticket>
    
    var body: some View {
        if processedTickets.isEmpty {
            Text("There are no processed requests")
        } else {
            TicketsList(tickets: processedTickets)
        }
    }
}

