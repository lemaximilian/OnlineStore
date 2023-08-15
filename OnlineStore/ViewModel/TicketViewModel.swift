//
//  TicketViewModel.swift
//  OnlineStore
//
//  Created by Maximilian Le on 15.08.23.
//

import SwiftUI
import CoreData

class TicketViewModel: ObservableObject {
    let controller = PersistenceController.shared
    @Published var tickets: [Ticket] = []
    
    func fetchTickets(viewContext: NSManagedObjectContext) {
        let request = NSFetchRequest<Ticket>(entityName: "Ticket")
        
        do {
            tickets = try viewContext.fetch(request)
        } catch let error {
            print("Error while fetching. \(error.localizedDescription)")
        }
    }
    
    func submitTicket(
        user: User,
        subject: String,
        request: String,
        viewContext: NSManagedObjectContext
    ) {
        let ticket = Ticket(context: viewContext)
        ticket.id = UUID()
        ticket.subject = subject
        ticket.request = request
        ticket.isProcessed = false
        ticket.user = user
        save(viewContext: viewContext)
    }
    
    func processTicket(
        ticket: Ticket,
        viewContext: NSManagedObjectContext
    ) {
        ticket.isProcessed = true
        save(viewContext: viewContext)
    }
    
    func removeTicket(at offsets: IndexSet, tickets: FetchedResults<Ticket>, viewContext: NSManagedObjectContext) {
        for index in offsets {
            let ticket = tickets[index]
            viewContext.delete(ticket)
        }
        save(viewContext: viewContext)
    }
    
    func save(viewContext: NSManagedObjectContext) {
        tickets.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.controller.save(viewContext: viewContext)
            self.fetchTickets(viewContext: viewContext)
        }
    }
}

