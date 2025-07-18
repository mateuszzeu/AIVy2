//
//  ContentView.swift
//  AIvy
//
//  Created by Liza on 15/07/2025.
//

import SwiftUI

struct AppRootView: View {
    @Bindable private var coordinator = Coordinator()

    var body: some View {
        NavigationStack {
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
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

