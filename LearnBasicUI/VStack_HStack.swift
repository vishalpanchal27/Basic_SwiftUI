//
//  VStack_HStack.swift
//  LearnBasicUI
//
//  Created by Vishal Panchal on 20/07/25.
//

import SwiftUI

struct VStack_HStack: View {
    @State private var userName: String = ""
    @State private var password: String = ""
    var body: some View {
        VStack {
            Text("Login").font(.largeTitle).padding()
            Text("Explore swiftUI with codecate15").font(.subheadline).padding()
            TextField("User name", text: $userName)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(4.0)
            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(4.0)
        }.padding()
        
        HStack {
            Button(action: {
                debugPrint("Login tapped")
            }, label: {
                Text("Login Password")
            })
            
            Spacer()
            
            Button(action: {
                debugPrint("Forget Password tapped")
            }, label: {
                Text("Forgot Password")
            })
        }.padding()
    }
}

#Preview {
    VStack_HStack()
}
