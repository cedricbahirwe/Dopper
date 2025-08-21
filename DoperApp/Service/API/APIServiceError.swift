//
//  APIServiceError.swift
//  DoperApp
//
//  Created by Cédric Bahirwe on 21/08/2025.
//

import Foundation

enum APIServiceError: LocalizedError {
    case invalidResponse
    case unableToEncode
    case invalidURL
    case generic(String)
}
