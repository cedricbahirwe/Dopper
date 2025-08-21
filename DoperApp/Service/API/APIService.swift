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


    func send<Response: Decodable>(endpoint: DoperEndpoint) async throws -> Response {
        guard let url = baseURL else {
            throw APIServiceError.invalidURL
        }

        let fullURL = url.appendingPathComponent(endpoint.path)

        var request = URLRequest(url: fullURL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        endpoint.headers.forEach { key, value in
            request.addValue(value, forHTTPHeaderField: key)
        }

        // Add the Bear Token if it existing


        do {
            request.httpBody = try JSONEncoder().encode(cred)
        } catch {
            throw APIServiceError.unableToEncode
        }

        do {
            let (data, _) = try await URLSession.shared.data(for: request, delegate: nil)

            let response = try JSONDecoder().decode(Response.self, from: data)
            print("JSON string: \(response)")
            return response
        } catch {
            print("Error \(error)")
            throw NSError(domain: "", code: -1001, userInfo: [NSLocalizedDescriptionKey: "Failed to load data"])
        }

    }
}
