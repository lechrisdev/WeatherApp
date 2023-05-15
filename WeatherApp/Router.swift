//
//  Router.swift
//  WeatherApp
//
//  Created by Le Chris on 05.04.2023.
//

import SwiftUI
import UIKit
import Swinject

class Router {
        
    private var navigationController: UINavigationController?
    
    init() {
    }
    
    func configureNavigationController() {
        if navigationController == nil {
            let vm = Container.shared.resolve(MainViewModel.self)!
            let vc = UIHostingController(rootView: MainView(router: self,
                                                            viewModel: vm,
                                                            locationManager: Container.shared.resolve(LocationManager.self)!))
            navigationController = UINavigationController(rootViewController: vc)
            navigationController?.title = ""
            UIApplication.shared.windows.first?.rootViewController = navigationController
        }
    }
    
    func showSearchScreen() {
        let vm = Container.shared.resolve(SearchScreenViewModel.self)!
        let vc = UIHostingController(rootView: SearchScreenView(router: self,
                                                                viewModel: vm))
//        vc.modalTransitionStyle = .crossDissolve
//        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func showWeatherView(lon: Double, lat: Double) {
        let vm = Container.shared.resolve(WeatherViewModel.self)!
        let vc = UIHostingController(rootView: WeatherView(router: self,
                                                           viewModel: vm,
                                                           lon: lon,
                                                           lat: lat))
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showCitiesList(models: [WeatherModel]) {
        let vm = Container.shared.resolve(CitiesListViewModel.self)!
        let vc = UIHostingController(rootView: CitiesListView(router: self,
                                                              viewModel: vm,
                                                              models: models))
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func back(animated: Bool = true) {
        self.navigationController?.popViewController(animated: animated)
    }
    
    func dismiss(animated: Bool = true) {
        self.navigationController?.dismiss(animated: animated)
    }
    
    func backToRoot(animated: Bool = true) {
        self.navigationController?.popToRootViewController(animated: animated)
    }
    
    func showAlert(onDeleteTap: @escaping () -> Void) {
        let vc = UIHostingController(rootView: AlertView(router: self, onDeleteTap: { onDeleteTap() }))
        vc.view.backgroundColor = .clear
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve

        self.navigationController?.present(vc, animated: true) //pushViewController(vc, animated: false)
    }
    
    
}
