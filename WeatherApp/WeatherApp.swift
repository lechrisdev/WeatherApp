//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Le Chris on 20.03.2023.
//

import SwiftUI

@main
struct WeatherApp: App {

    let router = Router()
    
    var body: some Scene {
        WindowGroup {
            EmptyView()
                .onAppear {
                    router.configureNavigationController()
                }
        }
    }
}
