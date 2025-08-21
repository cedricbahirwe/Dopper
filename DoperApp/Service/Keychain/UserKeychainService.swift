//
//  UserKeychainService.swift
//  DoperApp
//
//  Created by Cédric Bahirwe on 21/08/2025.
//


import KeychainAccess
import Foundation


protocol UserStorage {
    @discardableResult
    func save(user: DummyUser) -> Bool
    func getUser() -> DummyUser?
    func deleteUser()
}

class UserKeychainService: UserStorage {
    private let keychain = Keychain(service: "com.cedricbahirwe.DoperApp")
    private let key = "currentUser"

    func save(user: DummyUser) -> Bool {
        do {
            let data = try JSONEncoder().encode(user)
            try keychain.set(data, key: key)
            return true
        } catch {
            print("Error saving user to Keychain: \(error)")
            return false
        }
    }

    func getUser() -> DummyUser? {
        do {
            guard let data = try keychain.getData(key) else { return nil }
            let user = try JSONDecoder().decode(DummyUser.self, from: data)
            return user
        } catch {
            print("Error retrieving user from Keychain: \(error)")
            return nil
        }
    }

    // Delete user
    func deleteUser() {
        try? keychain.remove(key)
    }
}
