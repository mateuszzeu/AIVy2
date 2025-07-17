//
//  ChatViewModel.swift
//  AIvy
//
//  Created by Liza on 17/07/2025.
//

import Foundation
import Supabase
import Observation


@Observable
final class ChatViewModel {
    var inputText = ""
    
    func sendMessage(userID: String) async {
        let trimmed = inputText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        
        let message = ChatMessage(
            id: UUID().uuidString,
            user_id: userID,
            sender: "user",
            content: trimmed,
            created_at: ISO8601DateFormatter().string(from: .now)
        )
        
        try? await SupabaseService.sendMessage(message)
        
        inputText = ""
    }
}

