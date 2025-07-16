//
//  ContentView.swift
//  AIvy
//
//  Created by Liza on 15/07/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var coordinator = Coordinator()

    var body: some View {
        Group {
            switch coordinator.screen {
            case .login:
                LoginView(coordinator: coordinator)
            case .register:
                RegisterView(coordinator: coordinator)
            case .chat:
                ChatView(coordinator: coordinator)
            }
        }
    }
}

