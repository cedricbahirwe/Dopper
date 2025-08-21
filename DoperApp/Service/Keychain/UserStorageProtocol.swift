//
//  UserStorageProtocol.swift
//  DoperApp
//
//  Created by Cédric Bahirwe on 21/08/2025.
//

import Foundation

protocol UserStorageProtocol {
    @discardableResult
    func save(user: DummyUser) -> Bool
    func getUser() -> DummyUser?
    func deleteUser()
}
