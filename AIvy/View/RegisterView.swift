//
//  RegisterView.swift
//  AIvy
//
//  Created by Liza on 16/07/2025.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var coordinator: Coordinator
    @StateObject private var viewModel = RegisterViewModel()
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack {
            Text("Register")
                .font(.title2).bold()

            TextField("Email", text: $email)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            Button("Register") {
                Task {
                    await viewModel.register(email: email, password: password, coordinator: coordinator)
                }
            }
            .buttonStyle(.borderedProminent)
            .disabled(email.isEmpty || password.isEmpty)

            Button("Already have an account? Sign In") {
                coordinator.showLogin()
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
    RegisterView(coordinator: Coordinator())
}
