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


struct AlertAction {
    let title: String
    let handler: () -> Void
}
protocol AppAlert {
    var title: String { get }
    var message: String { get }
    var actions: [AlertAction]? { get }
}
struct AlertError: AppAlert {
    var title: String

    var message: String
    
    var actions: [AlertAction]?

    init(title: String = "Error", message: String, actions: [AlertAction]? = nil) {
        self.title = title
        self.message = message
        self.actions = actions
    }
}
class LoginViewModel: ObservableObject {
    @Published var loginCred = LoginCred(username: "emilys", password: "emilyspass")
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

        isLoginInProgress = true
        do {
            let userInfo = try await apiService.login(cred: loginCred)
            isLoginInProgress = false
            Task { @MainActor in
                self.user = userInfo
            }
        } catch {
            isLoginInProgress = false
            Task { @MainActor in
                alertError = AlertError(message: error.localizedDescription)
            }
        }
    }

    func getUser() -> DummyUser? {
        return user
    }
}
