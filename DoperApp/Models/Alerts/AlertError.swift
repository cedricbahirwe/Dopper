//
//  AlertError.swift
//  DoperApp
//
//  Created by Cédric Bahirwe on 21/08/2025.
//

import Foundation

struct AlertError: AppAlert {
    var id: UUID = UUID()
    var title: String
    var message: String?
    var actions: [AlertAction]?

    init(title: String = "Error", message: String, actions: [AlertAction]? = nil) {
        self.title = title
        self.message = message
        self.actions = actions
    }
}
