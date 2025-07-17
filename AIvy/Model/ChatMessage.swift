//
//  ChatMessage.swift
//  AIvy
//
//  Created by Liza on 17/07/2025.
//

import Foundation

struct ChatMessage: Codable, Identifiable {
    let id: String
    let user_id: String
    let sender: String
    let content: String
    let created_at: String
}
