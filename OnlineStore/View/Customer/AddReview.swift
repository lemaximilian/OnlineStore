//
//  AddReview.swift
//  OnlineStore
//
//  Created by Maximilian Le on 09.08.23.
//

import SwiftUI

struct AddReview: View {
    @Environment(\.managedObjectContext) var viewContext
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var productVM: ProductViewModel
    @EnvironmentObject var reviewVM: ReviewViewModel
    @Binding var showSheet: Bool
    @State var title: String = ""
    @State var comment: String = ""
    @State var rating = 0
    var maximumRating = 5
    let currentProduct: Product
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    Text("Title")
                        .bold()
                    TextField("Title of your Review", text: $title)
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom)
                    Text("Comment")
                        .bold()
                    TextField("Comment for the Product", text: $comment, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                Text("Rate the Product")
                    .bold()
                
                HStack {
                    ForEach(1..<maximumRating + 1, id: \.self) { number in
                        starImage(for: number)
                            .onTapGesture {
                                rating = number
                                print(number)
                            }
                    }
                }

                Button("Add Review") {
                    reviewVM.addReview(
                        title: title,
                        comment: comment,
                        rating: Int16(rating),
                        product: currentProduct,
                        user: userVM.currentUser,
                        viewContext: viewContext
                    )
                    userVM.save(viewContext: viewContext)
                    productVM.save(viewContext: viewContext)
                    showSheet = false
                }
                .buttonStyle(.borderedProminent)
                .padding(.top)
            }
            .navigationTitle("Add Review")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        showSheet = false
                    }
                }
            }
        }
    }
    
    func starImage(for number: Int) -> Image {
        if number > rating {
            return Image(systemName: "star")
        } else {
            return Image(systemName: "star.fill")
        }
    }
}


