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
    var messages: [ChatMessage] = []
    
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
        
        await sendToWebhook(trimmed)
        
        inputText = ""
    }
    
    func loadHistory(userID: String) async {
        do {
            messages = try await SupabaseService.fetchMessages(userID: userID)
        } catch {
            messages = []
        }
    }
    
    func sendToWebhook(_ message: String) async {
        guard let url = URL(string: "https://xzeu.app.n8n.cloud/webhook-test/9e62fe51-789a-4a15-adbd-3a19c02bea74") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body = ["content": message]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
        } catch {
            print("Webhook error:", error.localizedDescription)
        }
    }
}


