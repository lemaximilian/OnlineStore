//
//  UserViewModel.swift
//  OnlineStore
//
//  Created by Maximilian Le on 29.06.23.
//

import SwiftUI

class UserViewModel: ObservableObject {
    @Published private var userVM = User()
    
    var user: User {
        get { userVM }
        set { userVM = newValue }
    }
}
