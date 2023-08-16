//
//  TicketsList.swift
//  OnlineStore
//
//  Created by Maximilian Le on 16.08.23.
//

import SwiftUI

struct TicketsList: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var ticketVM: TicketViewModel
    var tickets: FetchedResults<Ticket>
    
    var body: some View {
        List {
            ForEach(tickets) { ticket in
                NavigationLink(destination: TicketItem(ticket: ticket)) {
                    Text(ticket.unwrappedSubject)
                }
            }
            .onDelete(perform: { indexSet in
                ticketVM.removeTicket(at: indexSet, tickets: tickets, viewContext: viewContext)
            })
        }
        .listStyle(.plain)
        .toolbar {
            EditButton()
        }
    }
}
