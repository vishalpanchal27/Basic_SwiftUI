//
//  LoginResponse.swift
//  LearnBasicUI
//
//  Created by Vishal Panchal on 02/08/25.
//

import Foundation

struct LoginResponse: Decodable {
    let errorMessage: String?
    let data: LoginResponseData?
}

struct LoginResponseData: Decodable {
    let userName, email: String
    let userId: Int
}
