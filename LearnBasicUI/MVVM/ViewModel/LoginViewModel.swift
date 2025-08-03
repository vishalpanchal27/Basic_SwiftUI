//
//  LoginViewModel.swift
//  LearnBasicUI
//
//  Created by Vishal Panchal on 02/08/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var userEamil: String = String()
    @Published var userPassword: String = String()
    @Published var errorMessage: String = String()
    @Published var navigate: Bool = false
    @Published var isPresentingErrorAlert: Bool = false
    
    private let loginValidator = LoginValidation()
    private let loginResource = LoginResource()
    

    func validateUserInputs() -> Bool {
        let result = loginValidator.validateUserInput(userEmail: userEamil, userPassword: userPassword)
        if !result.success {
            errorMessage = result.errorMessage ?? "error occured"
            isPresentingErrorAlert = true
            return false
        }
        return true
    }
    
    // call the api
    func authenticateUser() {
        let loginRequest = LoginRequest(userEmail: userEamil, userPassword: userPassword)
        loginResource.authenticate(loginRequest: loginRequest) { response in
            if response?.errorMessage == nil {
                DispatchQueue.main.async {
                    self.navigate = true
                }
            } else {
                DispatchQueue.main.async {
                    self.errorMessage = response?.errorMessage ?? "error occured"
                    self.isPresentingErrorAlert = true
                }
            }
        }
    }
}
