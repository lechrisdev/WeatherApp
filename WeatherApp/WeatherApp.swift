//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Le Chris on 20.03.2023.
//

import SwiftUI
import Swinject

@main
struct WeatherApp: App {
    
    var body: some Scene {
        WindowGroup {
            EmptyView()
                .onAppear {
                    _ = Assembler([AppAssembly()],
                                  container: Container.shared)
                    Container.shared.resolve(Router.self)!.configureNavigationController()
                }
        }
    }
}
