//
//  DummyUser.swift
//  DoperApp
//
//  Created by Cédric Bahirwe on 21/08/2025.
//

import SwiftUI

struct DummyUser: Codable {
    let id: Int
    let username: String
    let email: String
    let image: URL
    let accessToken: String
    let refreshToken: String
//    {
//      "id": 1,
//      "username": "emilys",
//      "email": "emily.johnson@x.dummyjson.com",
//      "firstName": "Emily",
//      "lastName": "Johnson",
//      "gender": "female",
//      "image": "https://dummyjson.com/icon/emilys/128",
//      "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...", // JWT accessToken (for backward compatibility) in response and cookies
//      "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..." // refreshToken in response and cookies
//    }
}

extension DummyUser {
    static let sample = DummyUser(id: 1, username: "Cedric", email: "ced#gmail.com", image: URL(string: "%")!, accessToken: "", refreshToken: "")
}
