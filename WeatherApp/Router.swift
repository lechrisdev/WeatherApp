//
//  Router.swift
//  WeatherApp
//
//  Created by Le Chris on 05.04.2023.
//

import SwiftUI
import UIKit

class Router {
        
    private var navigationController: UINavigationController?
    
    init() {
    }
    
    func configureNavigationController() {
        if navigationController == nil {
            let vm = MainViewModel(repo: Repository(), persistence: Persistence())
            let vc = UIHostingController(rootView: MainView(router: self, viewModel: vm))
            navigationController = UINavigationController(rootViewController: vc)
            navigationController?.title = ""
            UIApplication.shared.windows.first?.rootViewController = navigationController
        }
    }
    
    func showSearchScreen() {
        let vm = SearchScreenViewModel(repo: Repository())
        let vc = UIHostingController(rootView: SearchScreenView(router: self, viewModel: vm))
//        vc.modalTransitionStyle = .crossDissolve
//        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func showWeatherView(lon: Double, lat: Double) {
        let vm = WeatherViewModel(repo: Repository(), persistence: Persistence())
        let vc = UIHostingController(rootView: WeatherView(router: self, viewModel: vm, lon: lon, lat: lat))
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showCitiesList(models: [WeatherModel]) {
        let vm = CitiesListViewModel(persistence: Persistence(), repo: Repository())
        let vc = UIHostingController(rootView: CitiesListView(router: self, viewModel: vm, models: models))
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func back(animated: Bool = true) {
        self.navigationController?.popViewController(animated: animated)
    }
    
    func backToRoot(animated: Bool = true) {
        self.navigationController?.popToRootViewController(animated: animated)
    }
    
}
