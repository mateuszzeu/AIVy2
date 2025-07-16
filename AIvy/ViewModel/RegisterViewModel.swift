//
//  RegisterViewModel.swift
//  AIvy
//
//  Created by Liza on 16/07/2025.
//

import Foundation
import Supabase

final class RegisterViewModel: ObservableObject {
    @Published var infoMessage: String?

    func register(email: String, password: String, coordinator: Coordinator) async {
        do {
            let session = try await supabase.auth.signUp(email: email, password: password)
            let user = session.user

            let newUser = AppUser(
                id: user.id.uuidString,
                email: user.email ?? email,
                name: email.components(separatedBy: "@").first ?? email
            )

            await MainActor.run {
                coordinator.login(newUser)
                self.infoMessage = "Registered & Signed in!"
            }
        } catch {
            await MainActor.run {
                self.infoMessage = error.localizedDescription
            }
        }
    }
}

