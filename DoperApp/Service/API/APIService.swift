//
//  APIService.swift
//  DoperApp
//
//  Created by Cédric Bahirwe on 21/08/2025.
//

import Foundation
import Alamofire

class APIService {
    private let session: Session
    init(session: Session = .default) {
        self.session = session
    }

    func send<Response: Decodable>(endpoint: APIEndpoint) async throws -> Response {
        do {
            return try await session.request(endpoint)
                .validate(statusCodeValidation(request:response:data:))
                .serializingDecodable(Response.self).value
        } catch let afError as AFError {
            if case let .responseValidationFailed(reason) = afError,
               case let .customValidationFailed(innerError) = reason,
               let statusError = innerError as? APIStatusCodeError {
                throw statusError
            }
            throw afError
        }
    }
}


extension APIService {
    @Sendable private func statusCodeValidation(
        request: URLRequest?,
        response: HTTPURLResponse,
        data: Data?
    ) -> DataRequest.ValidationResult {
        if 200..<300 ~= response.statusCode {
            return .success(())
        } else {
            let decoder = JSONDecoder()
            if let json = data,
               let payload = try? decoder.decode(APIMessageError.self, from: json) {
                let statusError = APIStatusCodeError(
                    statusCode: response.statusCode,
                    message: payload.message)
                return .failure(statusError)
            }

            let error = APIStatusCodeError(
                statusCode: response.statusCode,
                message: data.map { String(decoding: $0, as: UTF8.self) } ?? "Unknown error"
            )
            return .failure(error)
        }
    }
}
