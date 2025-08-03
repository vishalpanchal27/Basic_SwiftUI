//
//  LoginView.swift
//  LearnBasicUI
//
//  Created by Vishal Panchal on 02/08/25.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginViewModel = LoginViewModel()
    @State private var isValidUser: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Email", text: $loginViewModel.userEamil)
                    .keyboardType(.emailAddress)
                
                SecureField("Password", text: $loginViewModel.userPassword)
                
                Button("Login") {
                    isValidUser = loginViewModel.validateUserInputs()
                    print("Login button clicked")
                }
                .navigationDestination(isPresented: $isValidUser) {
                    HomeView()
                }
                .alert(isPresented: $loginViewModel.isPresentingErrorAlert, content: {
                    Alert(title: Text("Alert"), message: Text(loginViewModel.errorMessage),
                          dismissButton: .cancel(Text("Ok")))
                    
                })
            }
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

#Preview {
    LoginView()
}
