//
//  TicketItem.swift
//  OnlineStore
//
//  Created by Maximilian Le on 15.08.23.
//

import SwiftUI

struct TicketItem: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var ticketVM: TicketViewModel
    @State var showAlert = false
    var ticket: Ticket
    
    var body: some View {
        VStack {
            
            Text("From:")
                .bold()
            Text(ticket.user?.username ?? "Unknown Username")
                .padding(.bottom)
            Text("Subject:")
                .bold()
            Text(ticket.subject ?? "Unknown Subject")
                .padding(.bottom)
            Text("Request:")
                .bold()
            Text(ticket.request ?? "Unknown Request")
                .padding(.bottom)
            
            HStack {
                Image(systemName: ticket.isProcessed ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(ticket.isProcessed ? .secondary : .primary)
                    .alert(isPresented: $showAlert) {
                        closeTicketAlert
                    }
                    .onTapGesture {
                        if !(ticket.isProcessed) {
                            showAlert = true
                        }
                    }
                Text(ticket.isProcessed ? "TICKET CLOSED" : "CLOSE TICKET")
                    .bold()
            }
        }
        .padding()
    }
    
    var closeTicketAlert: Alert {
        Alert(
            title: Text("Close Ticket"),
            message: Text("Are you sure to close the ticket? You can't undo that action!"),
            primaryButton: .destructive(Text("Confirm")) {
                ticketVM.processTicket(ticket: ticket, viewContext: viewContext)
                self.presentationMode.wrappedValue.dismiss()
            },
            secondaryButton: .cancel(Text("Cancel"))
        )
    }
}

