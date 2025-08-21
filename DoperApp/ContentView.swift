//
//  ContentView.swift
//  DoperApp
//
//  Created by Cédric Bahirwe on 21/08/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var appState = AppState()

    var body: some View {
        VStack {
            if let user = appState.user {
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
