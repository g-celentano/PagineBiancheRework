//
//  PagineBiancheReworkApp.swift
//  PagineBiancheRework
//
//  Created by Gaetano Celentano on 16/11/22.
//

import SwiftUI

@main
struct PagineBiancheReworkApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
