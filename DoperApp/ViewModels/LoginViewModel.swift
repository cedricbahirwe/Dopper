//
//  LoginViewModel.swift
//  DoperApp
//
//  Created by Cédric Bahirwe on 21/08/2025.
//

import Foundation

struct LoginCred: Encodable {
    var username: String
    var password: String
}

class LoginViewModel: ObservableObject {
    @Published var loginCred = LoginCred(username: "", password: "")
    @Published var user: DummyUser?
    @Published var isLoginInProgress = false
    @Published var alertError: AlertError?
    private let apiService: APIService


    init(apiService: APIService = APIService()) {
        self.apiService = apiService
    }

    func login() async {
        guard !loginCred.username.isEmpty else {
            return
        }

        Task { @MainActor in
            isLoginInProgress = true
        }
        do {
            let userInfo: DummyUser = try await apiService.send(endpoint: .login(creds: loginCred))
            Task { @MainActor in
                isLoginInProgress = false
                user = userInfo
            }
        } catch {
            Task { @MainActor in
                isLoginInProgress = false
                if let statusError = error as? APIStatusCodeError {
                    alertError = AlertError(message: statusError.message)
                } else {
                    alertError = AlertError(message: error.localizedDescription)
                }
            }
        }
    }

    func getUser() -> DummyUser? {
        return user
    }
}
