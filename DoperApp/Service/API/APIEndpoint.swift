//
//  APIEndpoint.swift
//  DoperApp
//
//  Created by Cédric Bahirwe on 21/08/2025.
//

import Alamofire
import Foundation

enum APIEndpoint {
    case login
    case getUser

    var path: String {
        switch self {
        case .login:
            "/user/login"
        case .getUser:
            "/user/me"
        }
    }
    var method: HTTPMethod {
        switch self {
        case .login:
                .post
        case .getUser:
                .get
        }

    }
    var headers: [String: String] {
        switch self {
        case .login:
            [:]
        case .getUser:
            ["Authorization": "Bearer YOUR_ACCESS_TOKEN"]
        }
    }

    var parameters: [String: Any] {
        switch self {
        case .login(let creds):
            creds.parameters
        case .getUser:
            [:]
        }
    }
}

extension APIEndpoint: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        let url = Constants.baseURL
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue

        urlRequest = try JSONEncoding.default.encode(
            urlRequest,
            with: parameters
        )
        return urlRequest
    }
}
