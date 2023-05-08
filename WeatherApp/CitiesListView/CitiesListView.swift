//
//  CitiesListView.swift
//  WeatherApp
//
//  Created by Le Chris on 29.03.2023.
//

import SwiftUI
import MapKit

struct CitiesListView: View {
    
    @ObservedObject var viewModel: CitiesListViewModel
    
    var router: Router
    
    init(router: Router, viewModel: CitiesListViewModel, models: [WeatherModel]) {
        self.router = router
        self.viewModel = viewModel
        self.viewModel.models = models
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Button {
                print("NAZAD NA WEATHER VIEW")
                router.back()
            } label: {
                AppAssets.arrowBack.swiftUIImage.frame(height: 44)
            }
            
            ScrollView {
                VStack(spacing: 16) {
                    // КОГДА БУДЕТ ФОР ИЧ - ТАМ ВЫСТАВИМ РАССТОЯНИЕ МЕЖДУ ЯЧЕЙКАМИ
                    ForEach(Array(viewModel.models.enumerated()), id: \.element) { index, weather in
                        CityDetailView(coordinate: CLLocationCoordinate2D(latitude: weather.latitude,
                                                                          longitude: weather.longtitude),
                                       temperature: viewModel.models[index].temperature,
                                       icon: viewModel.models[index].icon,
                                       date: Date(),
                                       onTapDelete: { coordinate in
                            viewModel.deleteCity(coordinate: coordinate)
                        })
                    }
                }
            }
            .padding(.top, 24)
        }
        .padding(.top, 12)
        .padding(.horizontal, 24)
    }
}

struct CitiesListView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = CitiesListViewModel(persistence: PersistenceMock(), repo: RepositoryMock())
        CitiesListView(router: Router(),
                       viewModel: vm,
                       models: [WeatherModel(icon: .drizzle,
                                             isLocal: false,
                                             temperature: 25,
                                             currentTime: Date(),
                                             uvIndex: 1,
                                             rainProbability: 10,
                                             airQuality: 10,
                                             hourlyWeather: [HourWeather(temperature: 20,
                                                                         icon: .drizzle,
                                                                         time: "10:25")],
                                             dailyWeather: [DayWeather(dayOfWeek: "monday",
                                                                       icon: .drizzle,
                                                                       probability: 10,
                                                                       dayTemp: 20,
                                                                       nightTemp: 15)],
                                             latitude: 0,
                                             longtitude: 0,
                                             timezone: "EDT"),
                                WeatherModel(icon: .drizzle,
                                             isLocal: false,
                                             temperature: 25,
                                             currentTime: Date(),
                                             uvIndex: 1,
                                             rainProbability: 10,
                                             airQuality: 10,
                                             hourlyWeather: [HourWeather(temperature: 20,
                                                                         icon: .drizzle,
                                                                         time: "10:25")],
                                             dailyWeather: [DayWeather(dayOfWeek: "monday",
                                                                       icon: .drizzle,
                                                                       probability: 10,
                                                                       dayTemp: 20,
                                                                       nightTemp: 15)],
                                             latitude: 0,
                                             longtitude: 0,
                                             timezone: "EDT")
                       ])
        
    }
}
