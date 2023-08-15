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
            List {
                ForEach(processedTickets) { ticket in
                    NavigationLink(destination: TicketItem(ticket: ticket)) {
                        Text(ticket.subject ?? "Unknown Subject")
                    }
                }
                .onDelete(perform: { indexSet in
                    ticketVM.removeTicket(at: indexSet, tickets: processedTickets, viewContext: viewContext)
                })
            }
            .listStyle(.plain)
            .toolbar {
                EditButton()
            }
        }
    }
}

