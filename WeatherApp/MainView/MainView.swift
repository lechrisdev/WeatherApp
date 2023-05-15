//
//  MainView.swift
//  WeatherApp
//
//  Created by Le Chris on 20.03.2023.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
    @ObservedObject var locationManager: LocationManager

    var router: Router
    
    init(router: Router, viewModel: MainViewModel, locationManager: LocationManager) {
        self.viewModel = viewModel
        self.locationManager = locationManager
        self.router = router
    }
    
    var body: some View {
        ZStack {
            AppAssets.backgroundColor.swiftUIColor
                .ignoresSafeArea()
            VStack {
                HStack {
                    
                    SearchFieldView(onTapSearch: {
                        print("кнопка поиска нажалась, переход на другой экран")
                        router.showSearchScreen()
                    }, onTapList: {
                        print("кнопка списка нажалась")
                        router.showCitiesList(models: viewModel.models.filter({ $0.isLocal == false }) )
                        
                    })
                    .padding(.horizontal, 24)
                }
                    
                TabView(content: {
                    
                    ForEach(Array(viewModel.models), id: \.self) { city in
                        ScrollView {
                            InformationView(model: city)
                                .padding(.horizontal, 24)
                        }
                    }
                }).tabViewStyle(.page)
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                    .ignoresSafeArea()
                    .padding(.top, 24)

            }
            .navigationBarHidden(true)
            .padding(.top, 12)
            .onAppear {
                print(">>>>>> locationManager.location.coordinate.latitude", locationManager.location.coordinate.latitude)
                if locationManager.location.coordinate.latitude != 0.0 {
                    viewModel.updateWeather()
                    viewModel.loadLocalWeather(coordinates2D: locationManager.location.coordinate)
                } else {
                    viewModel.updateWeather()
                }
            }
    //        .onReceive(viewModel.locationManager.location.publisher, perform: { location in
    //            print("SLOVO 2", location)
    //        })
            .onChange(of: locationManager.location) { location in
                viewModel.loadLocalWeather(coordinates2D: location.coordinate)
                print("SLOVO", location)
        }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = MainViewModel(repo: RepositoryMock(),
                               persistence: PersistenceMock())
        MainView(router: Router(), viewModel: vm, locationManager: LocationManager())
    }
}
