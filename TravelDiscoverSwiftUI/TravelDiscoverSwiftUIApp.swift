//
//  TravelDiscoverSwiftUIApp.swift
//  TravelDiscoverSwiftUI
//
//  Created by Rustam Keneev on 2/5/24.
//

import SwiftUI

@main
struct TravelDiscoverSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
