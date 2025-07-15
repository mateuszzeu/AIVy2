//
//  LoginView.swift
//  AIvy
//
//  Created by Liza on 15/07/2025.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var coordinator: ChatCoordinator
    @State private var inputName = ""
    @State private var showError = false
    
    var body: some View {
        VStack {
            Text("Welcome to AIvy chat!").font(.largeTitle)
            
            TextField("Enter your username...", text: $inputName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button("Start conversation") {
                if inputName.trimmingCharacters(in: .whitespaces).isEmpty {
                    showError = true
                } else {
                    coordinator.login(inputName)
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .alert("Please enter a username!", isPresented: $showError) {
            Button("OK", role: .cancel) { }
        }
    }
}
