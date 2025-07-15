//
//  ChatView.swift
//  AIvy
//
//  Created by Liza on 15/07/2025.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var coordinator: ChatCoordinator
    @StateObject private var viewModel = ChatViewModel()
    
    var body: some View {
        Text("Messages count: \(viewModel.messages.count)")
            .font(.caption)
        
        VStack{
            List(viewModel.messages, id: \.id) { message in
                HStack {
                    
                    Text(message.sender.name)
                        .bold()
                    
                    Text(message.text)
                }
            }
            
            if viewModel.isBotTyping {
                Text("Bot is typing...")
                    .italic()
                    .foregroundColor(.gray)
            }
            
            HStack {
                TextField("Type your message...", text: $viewModel.inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Send") {
                    if let username = coordinator.username {
                        viewModel.sendMessage(username: username)
                    }
                }
            }
            .padding()
        }
    }
}


#Preview {
    ChatView(coordinator: ChatCoordinator())
}
