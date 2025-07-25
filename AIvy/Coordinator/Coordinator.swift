//
//  Coordinator.swift
//  AIvy
//
//  Created by Liza on 15/07/2025.
//

import SwiftUI

@Observable
final class Coordinator {
    var screen: Screen = .login
    var currentUser: AppUser?

    enum Screen {
        case login
        case register
        case chat
    }

    func login(_ user: AppUser) {
        currentUser = user
        screen = .chat 
    }

    func logout() {
        currentUser = nil
        screen = .login
    }

    func showRegister() {
        screen = .register
    }

    func showLogin() {
        screen = .login
    }
}


