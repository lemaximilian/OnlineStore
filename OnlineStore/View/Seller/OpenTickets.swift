//
//  OpenRequests.swift
//  OnlineStore
//
//  Created by Maximilian Le on 15.08.23.
//

import SwiftUI

struct OpenTickets: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var ticketVM: TicketViewModel
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "isProcessed == %@", "0")) private var openTickets: FetchedResults<Ticket>
    
    var body: some View {
        if openTickets.isEmpty {
            Text("There are currently no open requests")
        } else {
            List {
                ForEach(openTickets) { ticket in
                    NavigationLink(destination: TicketItem(ticket: ticket)) {
                        Text(ticket.subject ?? "Unknown Subject")
                    }
                }
                .onDelete(perform: { indexSet in
                    ticketVM.removeTicket(at: indexSet, tickets: openTickets, viewContext: viewContext)
                })
            }
            .listStyle(.plain)
            .toolbar {
                EditButton()
            }
        }
    }
}

