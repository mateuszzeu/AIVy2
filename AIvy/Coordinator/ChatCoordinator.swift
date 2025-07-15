//
//  ChatCoordinator.swift
//  AIvy
//
//  Created by Liza on 15/07/2025.
//

import SwiftUI

final class ChatCoordinator: ObservableObject {
    @Published var username: String? = nil
    
    func login(_ name: String) {
        username = name
    }
    
    func logout() {
        username = nil
    }
}
