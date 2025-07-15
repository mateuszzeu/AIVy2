//
//  AIvyApp.swift
//  AIvy
//
//  Created by Liza on 15/07/2025.
//

import SwiftUI

@main
struct AIvyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
