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
                // КОГДА БУДЕТ ФОР ИЧ - ТАМ ВЫСТАВИМ РАССТОЯНИЕ МЕЖДУ ЯЧЕЙКАМИ
                ForEach(Array(viewModel.models.enumerated()), id: \.element) { index, weather in
                    CityDetailView(coordinate: CLLocationCoordinate2D(latitude: weather.latitude,
                                                                      longitude: weather.longtitude),
                                   temperature: viewModel.models[index].temperature,
                                   icon: viewModel.models[index].icon,
                                   date: Date())
                        .padding(.horizontal, 24)
                }
            }.padding(.top, 24)
        }
        .padding(.top, 12)
        .padding(.horizontal, 24)
    }
}

struct CitiesListView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = CitiesListViewModel(persistence: PersistenceMock(), repo: RepositoryMock())
        CitiesListView(router: Router(), viewModel: vm, models: [])
    }
}
