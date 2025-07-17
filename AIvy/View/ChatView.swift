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
            Text("👋 Welcome to the chat!")
                .font(.title)
            
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
    }
}


#Preview {
    ChatView(coordinator: Coordinator())
}


