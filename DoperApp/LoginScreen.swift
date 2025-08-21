//
//  LoginScreen.swift
//  DoperApp
//
//  Created by Cédric Bahirwe on 21/08/2025.
//

import SwiftUI

struct LoginScreen: View {
    @StateObject private var loginVM = LoginViewModel()
    @EnvironmentObject var appState: AppState

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text("Welcome to Doper App!")
                    .font(.system(size: 30, weight: .bold, design: .default))

                TextField("Enter your username", text: $loginVM.loginCred.username)
                    .padding(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 1)
                        )

                SecureField("Enter your password", text: $loginVM.loginCred.password)
                    .padding(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 1)
                    )
                Button(action: {
                    Task {
                        await loginVM.login()
                        let user = loginVM.getUser()
                        self.appState.setUser(user)
                    }
                }) {
                    Text("Login")
                        .padding(12)
                        .frame(maxWidth: .infinity)
                        .background(Color.black, in: RoundedRectangle(cornerRadius: 12))

                }
                .tint(.white)
            }
            .padding()
        }

//        .foregroundStyle(.white)
    }
}

#Preview {
    LoginScreen()
}
