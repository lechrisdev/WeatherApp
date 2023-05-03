//
//  AppAssembly.swift
//  WeatherApp
//
//  Created by Le Chris on 02.05.2023.
//

import Foundation
import Swinject

class AppAssembly: Assembly {
    func assemble(container: Container) {
        
        // MARK: - Managers
        container.register(Router.self, factory: { _ in
            Router()
        })
        .inObjectScope(.container)
        
        container.register(Repository.self) { _ in
            Repository()
        }
        .inObjectScope(.container)
        
        container.register(Persistence.self) { _ in
            Persistence()
        }
        .inObjectScope(.container)
        
        // MARK: - ViewModels
        
        container.register(MainViewModel.self, factory: { container in
            MainViewModel(repo: container.resolve(Repository.self)!,
                          persistence: container.resolve(Persistence.self)!
            )
        })
        
        container.register(SearchScreenViewModel.self, factory: { container in
            SearchScreenViewModel(repo: container.resolve(Repository.self)!
            )
        })
        
        container.register(WeatherViewModel.self, factory: { container in
            WeatherViewModel(repo: container.resolve(Repository.self)!,
                             persistence: container.resolve(Persistence.self)!
            )
        })
        
        container.register(CitiesListViewModel.self, factory: { container in
            CitiesListViewModel(persistence: container.resolve(Persistence.self)!,
                                repo: container.resolve(Repository.self)!
            )
        })
    }
}
