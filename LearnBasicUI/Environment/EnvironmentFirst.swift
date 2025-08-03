//
//  Environment.swift
//  LearnBasicUI
//
//  Created by Vishal Panchal on 31/07/25.
//

import SwiftUI

class UserModel : ObservableObject {
    @Published var name : String = String()
    @Published var email : String = String()
}

class AccountModel: ObservableObject {
    @Published var balance: Double = Double()
}

struct EnvironmentFirst: View {
    @ObservedObject private var user: UserModel = UserModel()
    @ObservedObject private var account: AccountModel = AccountModel()
    var body: some View {
        NavigationView {
            VStack {
                Text("User Name is \(user.name)")
                TextField("User", text: $user.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                NavigationLink("Navigate to second view", destination: EnvironmentSecond()).foregroundStyle(.blue)
            }
        }.environmentObject(user)
            .environmentObject(account)
    }
}

#Preview {
    EnvironmentFirst()
}
