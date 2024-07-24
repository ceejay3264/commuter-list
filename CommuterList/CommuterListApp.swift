//
//  CommuterListApp.swift
//  CommuterList
//
//  Created by Christopher Cordero on 7/23/24.
//

import SwiftUI

@main
struct CommuterListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
