//
//  APIServiceError.swift
//  DoperApp
//
//  Created by Cédric Bahirwe on 21/08/2025.
//

import Foundation

enum APIServiceError: LocalizedError {
    case networkError(Error)
    case decodingError(Error)
    case serverError(status: Int, data: Data?)
    case generic(String)
    case unknown

    var localizedDescription: String {
         switch self {
        case .networkError(let error):
            return error.localizedDescription
        case .decodingError(let error):
            return error.localizedDescription
        case .serverError(status: let status, data: let data):
            return "Server error: \(status), data: \(String(data: data ?? Data(), encoding: .utf8) ?? "nil")"
         case .generic(let msg):
             return msg
         case .unknown:
             return "Unknown error"
         }
    }
}


struct APIMessageError: Error, Decodable {
    let message: String
}

struct APIStatusCodeError: LocalizedError {
    let statusCode: Int
    let message: String

}
