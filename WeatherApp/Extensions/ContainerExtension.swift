//
//  ContainerExtension.swift
//  WeatherApp
//
//  Created by Le Chris on 02.05.2023.
//

import Foundation
import Swinject

extension Container {
    static var shared: Container = {
        let container = Container()
        return container
    }()
}
