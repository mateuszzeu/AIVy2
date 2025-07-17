//
//  ChatView.swift
//  AIvy
//
//  Created by Liza on 16/07/2025.
//
import SwiftUI

struct ChatView: View {
    @ObservedObject var coordinator: Coordinator
    @Bindable var viewModel = ChatViewModel()

    var body: some View {
        VStack {
            List(viewModel.messages, id: \.id) { message in
                Text(message.content)
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


