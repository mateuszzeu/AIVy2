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








/*
 
 
 struct Profile: Codable {
   let username: String?
   let fullName: String?
   let website: String?
   let avatarURL: String?

   enum CodingKeys: String, CodingKey {
     case username
     case fullName = "full_name"
     case website
     case avatarURL = "avatar_url"
   }
 }

 struct ChatMessage: Codable, Identifiable {
     let id: String
     let user_id: String
     let sender: String
     let content: String
     let created_at: String
 }

 struct NewChatMessage: Codable {
     let user_id: String
     let sender: String
     let content: String
 }
 
 
 
 
 
 
 
 
 
 @ViewBuilder
 private func typingView() -> some View {
   HStack(spacing: 4) {
     Circle().frame(width: 6, height: 6)
     Circle().frame(width: 6, height: 6)
     Circle().frame(width: 6, height: 6)
   }
   .padding(10)
   .background(Color.gray.opacity(0.2))
   .cornerRadius(10)
   .opacity(0.6)
   .animation(.easeInOut(duration: 0.8).repeatForever(), value: UUID())
 }

 private func start() async {
   guard let user = try? await supabase.auth.session.user else { return }
   userID = user.id.uuidString
   await subscribe(user.id.uuidString)
   await loadHistory()
 }

 @MainActor
 private func subscribe(_ uid: String) async {
   await channel?.unsubscribe()

   let ch = supabase.channel("conv-\(uid)")

   ch.onPostgresChange(
     InsertAction.self,
     schema: "public",
     table: "conversations",
     filter: "user_id=eq.\(uid)"
   ) { action in
     guard let msg = try? action.decodeRecord(
       as: ChatMessage.self,
       decoder: JSONDecoder()
     ) else { return }

     messages.removeAll { $0.id == TempID.typing }
     messages.append(msg)
   }

   channel = ch
   try? await ch.subscribe()
 }

 private func loadHistory() async {
   guard let uid = userID else { return }
   do {
     let resp: PostgrestResponse<[ChatMessage]> = try await supabase
       .from("conversations")
       .select()
       .eq("user_id", value: uid)
       .order("created_at", ascending: true)
       .execute()
     messages = resp.value
   } catch { print(error) }
 }

   private func send() {
     let trimmed = inputText.trimmingCharacters(in: .whitespacesAndNewlines)
     guard !trimmed.isEmpty, let uid = userID else { return }
     inputText = ""

     let localID = "local-\(UUID().uuidString)"
     let localMsg = ChatMessage(
       id: localID, user_id: uid, sender: "user",
       content: trimmed, created_at: ISO8601DateFormatter().string(from: .now)
     )
     messages.append(localMsg)

     let typing = ChatMessage(
       id: TempID.typing, user_id: uid, sender: "agent",
       content: "...", created_at: ISO8601DateFormatter().string(from: .now)
     )
     messages.append(typing)

     Task {
       let row = NewChatMessage(user_id: uid, sender: "user", content: trimmed)
       _ = try? await supabase.from("conversations").insert([row]).execute()

       await postToN8n(uid: uid, content: trimmed)

       Task {
         try? await Task.sleep(nanoseconds: 7_000_000_000)
         if messages.contains(where: { $0.id == TempID.typing }) {
           await loadHistory()
           messages.removeAll { $0.id == TempID.typing }
         }
       }
     }
   }


 private func postToN8n(uid: String, content: String) async {
   var req = URLRequest(url: n8nWebhook)
   req.httpMethod = "POST"
   req.setValue("application/json", forHTTPHeaderField: "Content-Type")
   req.httpBody = try? JSONEncoder().encode(["user_id": uid, "message": content])
   _ = try? await URLSession.shared.data(for: req)
 }
 
 */
