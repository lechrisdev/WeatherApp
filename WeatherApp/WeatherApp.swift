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
//
//                    // MARK: - OLD
//                    api.sendRequest(request: Requests.autoComplete(city: "Ode"), result: { data in
//                        if let result = try? JSONDecoder().decode(CityData.self, from: data) {
//                            print(">>>>> CITY", result)
//                        }
//                    })
                    
                    // MARK: - NEW
//                    Task {
//                        let data = await api.sendRequestData(request: Requests.getWeather(latitude: "46.5",
//                                                                                          longitude: "30.75"))
//                        if let data, let result = try? JSONDecoder().decode(WeatherData.self, from: data) {
//                            print(">>>>>", result)
//                        }
//
//                    }
                }
        }
    }
}
