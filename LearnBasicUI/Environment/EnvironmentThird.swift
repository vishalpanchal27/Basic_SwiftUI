//
//  EnvironmentThird.swift
//  LearnBasicUI
//
//  Created by Vishal Panchal on 31/07/25.
//

import SwiftUI

struct EnvironmentThird: View {
    @EnvironmentObject var user: UserModel
    @EnvironmentObject var account: AccountModel
    
    var body: some View {
        Text("the user name is \(user.name)")
        Text("the user account number is \(account.balance)")
    }
}

#Preview {
    EnvironmentThird()
        .environmentObject(UserModel())
        .environmentObject(AccountModel())
}
