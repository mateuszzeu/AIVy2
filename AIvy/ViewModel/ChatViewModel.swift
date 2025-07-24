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
        
        await MainActor.run { self.inputText = "" }
        
        let userMessage = ChatMessage(
            id: UUID().uuidString,
            user_id: userID,
            sender: "user",
            content: trimmed,
            created_at: ISO8601DateFormatter().string(from: .now)
        )
        try? await SupabaseService.sendMessage(userMessage)
        messages.append(userMessage)
        
        if let aiContent = await sendToWebhook(trimmed) {
            let aiMessage = ChatMessage(
                id: UUID().uuidString,
                user_id: userID,
                sender: "AI",
                content: aiContent,
                created_at: ISO8601DateFormatter().string(from: .now)
            )
            messages.append(aiMessage)
            try? await SupabaseService.sendMessage(aiMessage)
        } else { }
    }
    
    func loadHistory(userID: String) async {
        do {
            messages = try await SupabaseService.fetchMessages(userID: userID)
        } catch {
            messages = []
        }
    }
    
    func sendToWebhook(_ message: String) async -> String? {
        guard let url = URL(string:
                "https://xzeu33.app.n8n.cloud/webhook/9e62fe51-789a-4a15-adbd-3a19c02bea74")
        else { return nil }
        
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.httpBody = try? JSONSerialization.data(withJSONObject: ["content": message])

        do {
            let (data, _) = try await URLSession.shared.data(for: req)
            let _ = String(decoding: data, as: UTF8.self)
     
            if let top = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                if let direct = top["content"] as? String {
                    return direct
                }
                if let firstNested = top.values.first as? [String: Any],
                   let nestedContent = firstNested["output"] as? String {
                    return nestedContent
                }
            }
            return nil
        } catch {
            return nil
        }
    }
}

// https://xzeu33.app.n8n.cloud/webhook-test/9e62fe51-789a-4a15-adbd-3a19c02bea74    TEST

// https://xzeu33.app.n8n.cloud/webhook/9e62fe51-789a-4a15-adbd-3a19c02bea74     OG
