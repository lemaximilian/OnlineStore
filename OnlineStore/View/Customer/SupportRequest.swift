//
//  SupportRequest.swift
//  OnlineStore
//
//  Created by Maximilian Le on 14.08.23.
//

import SwiftUI

struct SupportRequest: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var ticketVM: TicketViewModel
    @State var showAlert = false
    @State var activeAlert: ActiveAlert = .first
    @State var subject: String = ""
    @State var request: String = ""
    
    var body: some View {
        VStack {
            Text("Subject")
                .bold()
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Enter subject...", text: $subject)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                .padding(.bottom)
            Text("Request")
                .bold()
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Enter your request...", text: $request, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
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
        .navigationTitle("Request Support")
        .padding()
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


