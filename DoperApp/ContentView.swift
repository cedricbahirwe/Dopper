//
//  ContentView.swift
//  DoperApp
//
//  Created by Cédric Bahirwe on 21/08/2025.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var user: DummyUser?
    private let userStorage: UserStorage
    init(user: DummyUser? = nil, userStorage: UserStorage = UserKeychainService()) {
        self.user = user
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
        self.setUser(nil)
    }
}

struct ContentView: View {
    @StateObject private var appState = AppState()

    var body: some View {
        VStack {
            if let user = appState.user  {
                UserInformationView(user: user)
            } else {
                LoginScreen()
            }
        }
        .environmentObject(appState)
    }
}

#Preview {
    ContentView()
}
