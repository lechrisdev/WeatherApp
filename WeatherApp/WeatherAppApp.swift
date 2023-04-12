//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Le Chris on 20.03.2023.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    let persistenceController = PersistenceController.shared
    let router = Router()

    var body: some Scene {
        WindowGroup {
            EmptyView()
                .onAppear {
                    router.configureNavigationController()
                    router.showMainScreen()
                }
//            MainView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
