//
//  ChatViewModel.swift
//  AIvy
//
//  Created by Liza on 15/07/2025.
//

import SwiftUI

final class ChatViewModel: ObservableObject {
    @Published var messages: [ChatMessage] = []
    @Published var inputText: String = ""
    @Published var isBotTyping: Bool = false
    
    func sendMessage(username: String) {
        guard !inputText.isEmpty else { return }
        let newMessage = ChatMessage(
            id: UUID().uuidString,
            sender: ChatUser(id: UUID().uuidString, name: username),
            text: inputText,
            sentAt: Date()
        )
        messages.append(newMessage)
        inputText = ""
        handleBotReply(username: username)
    }
    
    func handleBotReply(username: String) {
        isBotTyping = true
        
        Task {
            try? await Task.sleep(for: .seconds(2))
            
            await MainActor.run { self.isBotTyping = false }
            
            try? await Task.sleep(for: .seconds(3))
            
            await MainActor.run {
                let botMessage = ChatMessage(
                    id: "BOT",
                    sender: ChatUser(id: UUID().uuidString, name: "Bot"),
                    text: "Hi \(username)! How are you?",
                    sentAt: Date()
                )
                self.messages.append(botMessage)
                self.isBotTyping = false
            }
        }
    }
}
