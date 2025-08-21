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

            if loginVM.isLoginInProgress {
                Color.black.opacity(0.3).ignoresSafeArea()
                ProgressView()
                    .progressViewStyle(.circular)
                    .padding(30)
                    .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 10)
            }
        }
        .alert(item: $loginVM.alertError) { alert in
            Alert(title: Text(alert.title), message: Text(alert.message))
        }
//        .foregroundStyle(.white)
    }
}

#Preview {
    LoginScreen()
}
