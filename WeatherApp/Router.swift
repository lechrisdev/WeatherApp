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
            let vc = UIHostingController(rootView: MainView(router: self))
            navigationController = UINavigationController(rootViewController: vc)
            navigationController?.title = ""
            UIApplication.shared.windows.first?.rootViewController = navigationController
        }
    }
    
    func showSearchScreen() {
        let vc = UIHostingController(rootView: SearchScreenView(router: self))
//        vc.modalTransitionStyle = .crossDissolve
//        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func showWeatherView(lon: Double, lat: Double) {
        let vc = UIHostingController(rootView: WeatherView(router: self, lon: lon, lat: lat))
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showCitiesList() {
        let vc = UIHostingController(rootView: CitiesListView(router: self))
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func back(animated: Bool = true) {
        self.navigationController?.popViewController(animated: animated)
    }
    
    func backToRoot(animated: Bool = true) {
        self.navigationController?.popToRootViewController(animated: animated)
    }
    
}
