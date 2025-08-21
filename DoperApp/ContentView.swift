//
//  ContentView.swift
//  DoperApp
//
//  Created by Cédric Bahirwe on 21/08/2025.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var user: DummyUser?
//    let storage =

    init(user: DummyUser? = nil) {
        self.user = user
    }


    func setUser(_ user: DummyUser?) {
        self.user = user
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
