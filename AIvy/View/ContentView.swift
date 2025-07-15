//
//  ContentView.swift
//  AIvy
//
//  Created by Liza on 15/07/2025.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject private var coordinator = ChatCoordinator()
    
    var body: some View {
        Group {
            if let _ = coordinator.username {
                ChatView(coordinator: coordinator)
            } else {
                LoginView(coordinator: coordinator)
            }
        }
    }
}


#Preview {
    ContentView()
}
