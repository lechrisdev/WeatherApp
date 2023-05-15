//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Le Chris on 03.04.2023.
//

import SwiftUI

struct WeatherView: View {
    
    @ObservedObject var viewModel: WeatherViewModel
    
    let lon: Double
    let lat: Double
    
    @State var isAdded: Bool = false
    
    var router: Router
    
    init(router: Router, viewModel: WeatherViewModel, lon: Double, lat: Double) {
        self.viewModel = viewModel
        self.lon = lon
        self.lat = lat
        self.router = router
    }
    
    var body: some View {
        ZStack {
            AppAssets.backgroundColor.swiftUIColor
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                
                HStack {
                    Button {
                        print("Нажата кнопка НАЗАТТ")
                        router.backToRoot()
                    } label: {
                        AppAssets.arrowBack.swiftUIImage
                            .renderingMode(.template)
                            .foregroundColor(.primary)
                            .frame(height: 44)
                    }

                    Spacer()
                    
                    Button {
                        print("Нажата кнорка добавить")
                                                                // СОХРАНИТЬ В CORE DATA
                        guard let latitude = viewModel.model?.latitude,
                                let longitude = viewModel.model?.longtitude else { return }
                        viewModel.saveToCoreData(lat: latitude, lon: longitude)
                        withAnimation {
                            isAdded.toggle()  //= true
                        }
                    } label: {
                        HStack(spacing: 8) {                    // КНОПКА МЕНЯЕТСЯ НА ЗЕЛЕНУЮ
                            Text(isAdded ? "Added to list" : "Add to list")
                                .foregroundColor( isAdded ? Color.white : .primary)
                            if isAdded {
                                AppAssets.done.swiftUIImage
                            } else {
                                AppAssets.add.swiftUIImage
                                    .renderingMode(.template)
                                    .foregroundColor(.primary)
                            }
                        }
                        .padding(.all, 14)
                    } .roundedBackground(bgColor: isAdded ? AppAssets.green.swiftUIColor : AppAssets.lightGray.swiftUIColor)
                        
                }
                .frame(height: 44)
                
                ScrollView {
                    if let model = viewModel.model {
                        InformationView(model: model)
                    }
                }
                .padding(.top, 24)
                
            }
            .padding(.top, 12)
            .padding(.horizontal, 24)
            .onAppear {
                viewModel.getWeather(lon: lon, lat: lat)
        }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(router: Router(),
                    viewModel: WeatherViewModel(repo: RepositoryMock(),
                                                persistence: PersistenceMock()),
                    lon: 0,
                    lat: 0)
    }
}
