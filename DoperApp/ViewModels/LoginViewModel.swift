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
protocol AppAlert: Identifiable {
    var title: String { get }
    var message: String { get }
    var actions: [AlertAction]? { get }
}
struct AlertError: AppAlert {
    var id: UUID = UUID()
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

        Task { @MainActor in
            isLoginInProgress = true
        }
        do {
            let userInfo: DummyUser = try await apiService .send(endpoint: .login(creds: loginCred))
            Task { @MainActor in
                isLoginInProgress = false
                user = userInfo
            }
        } catch {
            Task { @MainActor in
                isLoginInProgress = false
                alertError = AlertError(message: error.localizedDescription)
            }
        }
    }

    func getUser() -> DummyUser? {
        return user
    }
}
