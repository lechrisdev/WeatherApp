//
//  CitiesListView.swift
//  WeatherApp
//
//  Created by Le Chris on 29.03.2023.
//

import SwiftUI
import MapKit

struct DropViewDelegate: DropDelegate {
    
    let destinationItem: WeatherModel
    @Binding var cities: [WeatherModel]
    @Binding var draggedItem: WeatherModel?
    var onDropped: () -> Void
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
    
    func performDrop(info: DropInfo) -> Bool {
        draggedItem = nil
        onDropped()
        print(">>>> DROPPED")
        return true
    }
    
    func dropEntered(info: DropInfo) {
        // Swap Items
        if let draggedItem {
            let fromIndex = cities.firstIndex(of: draggedItem)
            if let fromIndex {
                let toIndex = cities.firstIndex(of: destinationItem)
                if let toIndex, fromIndex != toIndex {
                    withAnimation {
                        self.cities.move(fromOffsets: IndexSet(integer: fromIndex),
                                         toOffset: (toIndex > fromIndex ? (toIndex + 1) : toIndex))
                    }
                }
            }
        }
    }
}

struct CitiesListView: View {
    
    @ObservedObject var viewModel: CitiesListViewModel
    
    @State private var draggedCity: WeatherModel?
    
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
            }.padding(.horizontal, 24)
            
            ScrollView {
                VStack(spacing: 16) {
                    
                    ForEach(Array(viewModel.models.enumerated()), id: \.element) { index, weather in
                        CityDetailView(weather: weather,
                                       onTapDelete: { coordinate in
                                            viewModel.deleteCity(coordinate: coordinate)
                        })
                        .onDrag {
                            self.draggedCity = weather
                            return NSItemProvider()
                        }
                        .onDrop(of: [.text],
                                delegate: DropViewDelegate(destinationItem: weather,
                                                           cities: $viewModel.models,
                                                           draggedItem: $draggedCity, onDropped: {
                            viewModel.updateCitiesOrder()
                        })
                        )
                    }
                }
            }
            .padding(.top, 24)
            .padding(.horizontal, 24)
            .onChange(of: viewModel.models,
                      perform: { models in
//
            })
        }
        .padding(.top, 12)
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
