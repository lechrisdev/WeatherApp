//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Le Chris on 03.04.2023.
//

import SwiftUI

struct WeatherView: View {
    
    let repo = Repository()
    
    let lon: Double
    let lat: Double
    
    @State var model: WeatherModel?
    
    var router: Router
    
    init(router: Router, lon: Double, lat: Double) {
        self.lon = lon
        self.lat = lat
        self.router = router
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Button {
                    print("Нажата кнопка НАЗАТТ")
                    router.back()
                } label: {
                    AppAssets.arrowBack.swiftUIImage
//                        .frame(width: 40)
                        .frame(height: 44)
                }

                Spacer()
                
                Button {
                    print("Нажата кнорка добавить")
                    router.showCitiesList()
                    // ТУТ ДОЛЖНА ПОМЕНЯТЬСЯ КНОПКА, НА ЗЕЛЕНУЮ
                    
                } label: {
                    HStack(spacing: 8) {
                        Text("Add to list")
                            .foregroundColor(Color.black)
                        AppAssets.add.swiftUIImage
                    }
                    .padding(.all, 14)
                } .roundedBackground()
                    
            }
//            .padding(.top, 12)
            .frame(height: 44)
            
            ScrollView {
                if let model {
                    InformationView(model: model)
                }
            }
            .padding(.top, 24)
            
        }
        .padding(.top, 12)
        .padding(.horizontal, 24)
        .onAppear {
            Task {
                self.model = await repo.getWeather(lon: lon, lat: lat)
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(router: Router(), lon: 0, lat: 0)
    }
}
