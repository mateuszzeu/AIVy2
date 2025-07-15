//
//  ContentView.swift
//  AIvy
//
//  Created by Liza on 15/07/2025.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject private var viewModel = ChatViewModel()
    
    @State var username: String = ""
    
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
            
            TextField("Type your username...", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            HStack {
                TextField("Type your message...", text: $viewModel.inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Send") {
                    viewModel.sendMessage(username: username)
                }
            }
            .padding()
        }
    }
}


#Preview {
    ContentView()
}
