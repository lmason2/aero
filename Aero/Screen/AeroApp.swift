//
//  AeroApp.swift
//  Aero
//
//  Created by Luke Mason on 1/1/22.
//

import SwiftUI

@main
struct AeroApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
