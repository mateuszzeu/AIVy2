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
    }
}
