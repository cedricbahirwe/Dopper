//
//  APIService.swift
//  DoperApp
//
//  Created by Cédric Bahirwe on 21/08/2025.
//

import Foundation
import Alamofire


class APIService {
    private let baseURL = URL(string: "https://dummyjson.com/")
    private let session: Session


    init(session: Session = .init()) {
        self.session = session
    }
    struct LoginRequest: Encodable {
        let email: String
        let password: String
    }

    func send<Response: Decodable>(endpoint: APIEndpoint) async throws -> Response {

//        let user: DummyUser = try await AF.request(url)
//                .serializingDecodable(DummyUser.self).value

        return try await AF.request(endpoint)
            .serializingDecodable(Response.self).value

//        return response
//        self.

//        let fullURL = url.appendingPathComponent(endpoint.path)
//
//        var request = URLRequest(url: fullURL)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        endpoint.headers.forEach { key, value in
//            request.addValue(value, forHTTPHeaderField: key)
//        }

        // Add the Bear Token if it existing


//        do {
//            request.httpBody = try JSONEncoder().encode(cred)
//        } catch {
//            throw APIServiceError.unableToEncode
//        }
//
//        do {
//            let (data, _) = try await URLSession.shared.data(for: request, delegate: nil)
//
//            let response = try JSONDecoder().decode(Response.self, from: data)
//            print("JSON string: \(response)")
//            return response
//        } catch {
//            print("Error \(error)")
//            throw NSError(domain: "", code: -1001, userInfo: [NSLocalizedDescriptionKey: "Failed to load data"])
//        }

    }
}
