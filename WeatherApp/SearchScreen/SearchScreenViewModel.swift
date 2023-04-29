//
//  SearchScreenViewModel.swift
//  WeatherApp
//
//  Created by Le Chris on 22.04.2023.
//

import Foundation

class SearchScreenViewModel: ObservableObject {
    
    @Published var cities: [CityModel] = []
    
    @Published var searchText: String = "киі"
    
    private var timers: [Timer] = []

    let repo : RepositoryProtocol
    
    init(repo: RepositoryProtocol) {
        self.repo = repo
    }
    
    @MainActor func search() {
        Task {
            self.cities = await repo.searchCity(name: searchText)
        }
    }
    
    func startTimer(withTimeInterval timeInterval: TimeInterval, completion: @escaping () -> Void) {
        cancelAllTimers()
        let timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false) { _ in
            completion()
        }
        timers.append(timer)
    }
    
    private func cancelAllTimers() {
        for timer in timers {
            timer.invalidate()
        }
        timers.removeAll()
    }

}
