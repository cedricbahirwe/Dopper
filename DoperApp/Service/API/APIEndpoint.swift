//
//  APIEndpoint.swift
//  DoperApp
//
//  Created by Cédric Bahirwe on 21/08/2025.
//

import Alamofire
import Foundation

enum APIEndpoint {
    case login(creds: LoginCred)
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

    var parameters: Parameters? {
        switch self {
        case .login(let creds):
            creds.dictionary
        case .getUser:
            [:]
        }
    }
}

extension APIEndpoint: URLRequestConvertible {
    static func route(_ path: String) -> URL {
        Constants.baseURL.appendingPathComponent(path)
    }

    func asURLRequest() throws -> URLRequest {
        let url = Constants.baseURL
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue

        urlRequest = try JSONEncoding.default.encode(
            urlRequest,
            with: parameters
        )
        print("Find", urlRequest)
        return urlRequest
    }
}
