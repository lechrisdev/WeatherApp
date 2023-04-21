//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Le Chris on 20.03.2023.
//

import SwiftUI

@main
struct WeatherApp: App {
    let persistenceController = PersistenceController.shared
    let router = Router()
//    let api = API()
    
    var body: some Scene {
        WindowGroup {
            EmptyView()
                .onAppear {
                    router.configureNavigationController()
                    router.showMainScreen()
                }
        }
    }
}
