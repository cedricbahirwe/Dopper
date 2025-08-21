//
//  AppState.swift
//  DoperApp
//
//  Created by Cédric Bahirwe on 21/08/2025.
//

import Foundation

class AppState: ObservableObject {
    @Published var user: DummyUser?
    private let userStorage: UserStorageProtocol

    init(userStorage: UserStorageProtocol = UserKeychainService()) {
        self.userStorage = userStorage
        getUserStoredInfo()
    }

    func getUserStoredInfo() {
        self.user = userStorage.getUser()
    }

    func setUser(_ user: DummyUser?) {
        if let user {
            self.user = user
            userStorage.save(user: user)
        } else {
            self.user = nil
            userStorage.deleteUser()
        }
    }


    func logout() {
        setUser(nil)
    }
}
