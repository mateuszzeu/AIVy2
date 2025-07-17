//
//  SupabaseService.swift
//  AIvy
//
//  Created by Liza on 17/07/2025.
//

import SwiftUI
import Supabase


enum SupabaseService {
    static func sendMessage(_ message: ChatMessage) async throws {
        try await supabase
            .from("conversations")
            .insert([message])
            .execute()
    }
    
    static func fetchMessages(userID: String) async throws -> [ChatMessage] {
        let response: PostgrestResponse<[ChatMessage]> = try await supabase
            .from("conversations")
            .select()
            .eq("user_id", value: userID)
            .order("created_at", ascending: true)
            .execute()
        
        return response.value                
    }
}


