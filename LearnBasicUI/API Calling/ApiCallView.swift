//
//  ApiCallView.swift
//  LearnBasicUI
//
//  Created by Vishal Panchal on 04/08/25.
//

import SwiftUI

struct userModel: Decodable {
    var id: Int
    var firstName: String
    var lastName: String
    var maidenName: String
    var image: String
}

struct UsersResponse: Decodable {
    let users: [userModel]
}

enum ServerErrors: String, Error {
    case invalidUrl = "Invalid URL"
    case invalidResponse = "Invalid Response"
    case invalidData = "Invalid Data"
    case failedToLoadData = "Failed to Load Data"
}

struct ApiCallView: View {
    @State private var userData: [userModel] = []
    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: userData.count > 0 ?  userData[0].image : "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(.circle)
                    .frame(width: 120, height: 120)
                
            } placeholder: {
                Circle()
                    .foregroundColor(.secondary)
                    .frame(width: 120, height: 120)
            }
                
            Text(userData.count > 0 ? userData[0].firstName : "")
                .bold()
                .font(.title)
            
            Text("Description")
                .padding()
            
            Spacer()
        }
        .padding()
        .task {
            do {
                userData = try await getUserData()
            } catch ServerErrors.invalidUrl {
                print("InCorrect Url")
            } catch ServerErrors.invalidResponse {
                print("invalid response")
            } catch ServerErrors.invalidData {
                print("invalid data")
            } catch {
                print("unKnown error occur")
            }
        }
    }
    
    func getUserData() async throws -> [userModel] {
        guard let url = URL(string: "https://dummyjson.com/users") else {
            throw ServerErrors.invalidUrl
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw ServerErrors.invalidResponse
        }

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decoded = try decoder.decode(UsersResponse.self, from: data)
            return decoded.users
        } catch {
            throw ServerErrors.invalidData
        }
    }

    
}

#Preview {
    ApiCallView()
}
