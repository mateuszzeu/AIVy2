//
//  ChatView.swift
//  AIvy
//
//  Created by Liza on 16/07/2025.
//
import SwiftUI

struct ChatView: View {
    @ObservedObject var coordinator: Coordinator
    @State private var inputText = ""

    var body: some View {
        VStack {
            Text("👋 Welcome to the chat!")
                .font(.title)
            
            TextField("Write your message...", text: $inputText)
                .textFieldStyle(.roundedBorder)
            
            Button("Send") {
                let trimmed = inputText.trimmingCharacters(in: .whitespacesAndNewlines)
                guard !trimmed.isEmpty,
                      let userID = coordinator.currentUser?.id else { return }
                
                let message = ChatMessage(
                    id: UUID().uuidString,
                    user_id: userID,
                    sender: "user",
                    content: trimmed,
                    created_at: ISO8601DateFormatter().string(from: .now)
                )
                    
                Task {
                    try? await SupabaseService.sendMessage(message)
                }
                    
                inputText = ""
            }
            
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
