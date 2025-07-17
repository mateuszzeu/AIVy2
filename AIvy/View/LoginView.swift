//
//  LoginView.swift
//  AIvy
//
//  Created by Liza on 15/07/2025.
//

import SwiftUI

struct LoginView: View {
    @Bindable var coordinator: Coordinator
    @Bindable private var viewModel = LoginViewModel()
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack {
            Text("Sign In")
                .font(.title2).bold()

            TextField("Email", text: $email)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            Button("Sign In") {
                Task {
                    await viewModel.login(email: email, password: password, coordinator: coordinator)
                }
            }
            .buttonStyle(.borderedProminent)
            .disabled(email.isEmpty || password.isEmpty)

            Button("No account? Register") {
                coordinator.showRegister()
            }
            .font(.footnote)

            if let info = viewModel.infoMessage {
                Text(info)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
    }
}

#Preview {
    LoginView(coordinator: Coordinator())
}

