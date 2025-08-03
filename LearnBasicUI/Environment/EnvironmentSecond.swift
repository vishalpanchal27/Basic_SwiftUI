//
//  EnvironmentSecond.swift
//  LearnBasicUI
//
//  Created by Vishal Panchal on 31/07/25.
//

import SwiftUI



struct EnvironmentSecond: View {
    
    @EnvironmentObject var account: AccountModel
    
    var body: some View {
        VStack {
//            TextField("accound Number", value: $account.accoundNumber, formatter: NumberFormatter())
//                .textFieldStyle(RoundedBorderTextFieldStyle())
            Stepper("Balance: \(account.balance)", value: $account.balance)
            NavigationLink("Navigate to second view", destination: EnvironmentThird()).foregroundStyle(.blue)
        }.padding()
            .environmentObject(account)
        
    }
}

#Preview {
    EnvironmentSecond()
        .environmentObject(AccountModel())
}
