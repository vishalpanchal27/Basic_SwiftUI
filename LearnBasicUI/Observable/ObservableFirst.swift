//
//  ObservableFirst.swift
//  LearnBasicUI
//
//  Created by Vishal Panchal on 31/07/25.
//

import SwiftUI

class User : ObservableObject {
    @Published var name : String = String()
    @Published var email : String = String()
}

struct ObservableFirst: View {
    
    @ObservedObject private var user: User = User()
    var body: some View {
        VStack {
            Text("User Name is \(user.name)")
            TextField("User", text: $user.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
    }
}

#Preview {
    ObservableFirst()
}
