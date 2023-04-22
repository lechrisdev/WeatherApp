//
//  SearchScreenViewModel.swift
//  WeatherApp
//
//  Created by Le Chris on 22.04.2023.
//

import Foundation

class SearchScreenViewModel: ObservableObject {
    
    @Published var cities: [CityModel] = []
    
    @Published var searchText: String = "Оде"

    let repo = Repository()
    
    func search() {
        Task {
            self.cities = await repo.searchCity(name: searchText)
        }
    }
    
}
