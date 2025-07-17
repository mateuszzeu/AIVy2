//
//  ChatView.swift
//  AIvy
//
//  Created by Liza on 16/07/2025.
//
import SwiftUI

struct ChatView: View {
    @Bindable var coordinator: Coordinator
    @Bindable var viewModel = ChatViewModel()

    var body: some View {
        VStack {
            List(viewModel.messages, id: \.id) { message in
                HStack {
                    if message.sender == "AI" {
                        Text(message.content)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(12)
                    } else {
                        Text(message.content)
                            .padding()
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(12)
                        Spacer()
                    }
                }
            }
            
            TextField("Write your message...", text: $viewModel.inputText)
                .textFieldStyle(.roundedBorder)
            
            Button("Send") {
                guard let userID = coordinator.currentUser?.id else { return }
                    
                Task {
                    await viewModel.sendMessage(userID: userID)
                }
            }
            
            Button("Logout") {
                coordinator.logout()
            }
            .foregroundColor(.red)
        }
        .padding()
        .task {
            if let userID = coordinator.currentUser?.id {
                await viewModel.loadHistory(userID: userID)
            }
        }
    }
}


#Preview {
    ChatView(coordinator: Coordinator())
}


