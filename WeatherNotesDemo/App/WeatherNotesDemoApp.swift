//
//  WeatherNotesDemoApp.swift
//  WeatherNotesDemo
//
//  Created by Cosmos on 05.12.2025.
//

import SwiftUI

@main
struct WeatherNotesDemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
