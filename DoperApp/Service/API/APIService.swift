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
        do {
            return try await AF.request(endpoint)
                .validate(statusCodeValidation(request:response:data:))
                .serializingDecodable(Response.self).value
        } catch let afError as AFError {
            if case let .responseValidationFailed(reason) = afError,
               case let .customValidationFailed(innerError) = reason,
               let statusError = innerError as? APIStatusCodeError {
                throw statusError
            }
            throw afError // forward anything else
        }
    
//        switch dataResponse.result {
//        case .success(let value):
//            return value
////        case .failure(let error):
////            throw error
//        case .failure(let error):
//            if case .responseSerializationFailed(let reason) = afError {
//                switch reason {
//                case .decodingFailed(let underlying):
//                    throw APIServiceError.decodingError(underlying)
//                default:
//                    throw APIServiceError.networkError(afError)
//                }
//            }
//
//            if case .responseValidationFailed(let reason) = afError,
//               case .unacceptableStatusCode(let code) = reason {
//                throw APIServiceError.serverError(
//                    status: code,
//                    data: dataResponse.data
//                )
//            }
//
//            throw f
//        }

//        do {
//            let response = try await AF.request(endpoint)
//                .serializingDecodable(Response.self).value
//            return response
//        } catch let afError as AFError {
//            // Alamofire specific error
//            if case .responseValidationFailed(let reason) = afError {
//                switch reason {
//                case .unacceptableStatusCode(let code):
//                    let data = try? await AF.request(endpoint)
//                        .serializingData().value
//                    throw APIServiceError.serverError(status: code, data: data)
//                default:
//                    throw APIServiceError.networkError(afError)
//                }
//            }
//            throw APIServiceError.networkError(afError)
//        } catch let decodingError as DecodingError {
//            throw APIServiceError.decodingError(decodingError)
//        } catch let urlError as URLError {
//            throw APIServiceError.networkError(urlError)
//        } catch {
//            throw APIServiceError.unknown
//        }
    }

    @Sendable
    private func statusCodeValidation(
        request: URLRequest?,
        response: HTTPURLResponse,
        data: Data?
    ) -> DataRequest.ValidationResult {
        if 200..<300 ~= response.statusCode {
            return .success(())
        } else {
            print("we arehere")
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
