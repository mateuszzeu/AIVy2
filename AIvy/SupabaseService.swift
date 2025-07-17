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
}
