//
//  SubmitRequestButton.swift
//  OnlineStore
//
//  Created by Maximilian Le on 16.08.23.
//

import SwiftUI

struct SubmitRequestButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var ticketVM: TicketViewModel
    var subject: String
    var request: String
    @Binding var showAlert: Bool
    @Binding var activeAlert: ActiveAlert
    
    
    var body: some View {
        Button("Submit Request") {
            if subject.isEmpty || request.isEmpty {
                activeAlert = .first
                showAlert = true
            } else {
                ticketVM.submitTicket(
                    user: userVM.currentUser,
                    subject: subject,
                    request: request,
                    viewContext: viewContext
                )
                activeAlert = .second
                showAlert = true
            }
        }
        .buttonStyle(.borderedProminent)
        .padding()
        .alert(isPresented: $showAlert) {
            switch activeAlert {
            case .first: return missingAlert
            case .second: return submitAlert
            }
        }
    }
    
    var missingAlert: Alert {
        Alert(
            title: Text("Missing Inputs"),
            message: Text("Please check your inputs"),
            dismissButton: .default(Text("Confirm"))
        )
    }
    
    var submitAlert: Alert {
        Alert(
            title: Text("Request submitted!"),
            message: Text("We will try to answer your request as soon as possible."),
            dismissButton: .cancel(Text("OK")) {
                self.presentationMode.wrappedValue.dismiss()
            }
        )
    }
}


