//
//  ChatView.swift
//  AIvy
//
//  Created by Liza on 16/07/2025.
//
import SwiftUI

struct ChatView: View {
    @ObservedObject var coordinator: Coordinator

    var body: some View {
        VStack {
            Text("👋 Welcome to the chat!")
                .font(.title)

            Button("Logout") {
                coordinator.logout()
            }
            .foregroundColor(.red)
        }
        .padding()
    }
}


#Preview {
    ChatView(coordinator: Coordinator())
}
