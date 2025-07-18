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
        VStack(spacing: 0) {
            ScrollViewReader { scrollProxy in
                List(viewModel.messages, id: \.id) { message in
                    HStack(alignment: .top) {
                        if message.sender == "AI" {
                            Text(message.content)
                                .padding(10)
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(12)
                            Spacer()
                        } else {
                            Spacer()
                            Text(message.content)
                                .padding(10)
                                .background(Color.phthaloGreen.opacity(0.2))
                                .cornerRadius(12)
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                .scrollDismissesKeyboard(.interactively)
                .listStyle(.plain)
                .onChange(of: viewModel.messages.count) {
                    if let last = viewModel.messages.last {
                        withAnimation {
                            scrollProxy.scrollTo(last.id, anchor: .bottom)
                        }
                    }
                }
            }

            HStack {
                TextField("Write your message...", text: $viewModel.inputText)
                    .textFieldStyle(.roundedBorder)

                Button(action: {
                    guard let userID = coordinator.currentUser?.id else { return }
                    Task { await viewModel.sendMessage(userID: userID) }
                }) {
                    Image(systemName: "paperplane.fill")
                        .padding(8)
                        .background(Color.phthaloGreen)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
                .disabled(viewModel.inputText.trimmingCharacters(in: .whitespaces).isEmpty)
            }
            .padding()
        }
        .navigationTitle("Chat")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Logout") { coordinator.logout() }
            }
        }
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
