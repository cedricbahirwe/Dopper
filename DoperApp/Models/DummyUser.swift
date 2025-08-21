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
    let firstName: String
    let lastName: String
    let email: String
    let image: URL
    let gender: DummyUserGenre
    let accessToken: String
    let refreshToken: String
}

extension DummyUser {
    static let sample = DummyUser(id: 1, username: "cedbahirwe", firstName: "Cedric", lastName: "Bahirwe", email: "ced#gmail.com", image: URL(string: "https://dummyjson.com/icon/emilys/128")!, gender: .male, accessToken: "", refreshToken: "")
}
