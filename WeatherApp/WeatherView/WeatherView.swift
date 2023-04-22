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
    
    init(router: Router, lon: Double, lat: Double) {
        viewModel = WeatherViewModel()
        self.lon = lon
        self.lat = lat
        self.router = router
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Button {
                    print("Нажата кнопка НАЗАТТ")
                    router.backToRoot()
                } label: {
                    AppAssets.arrowBack.swiftUIImage
//                        .frame(width: 40)
                        .frame(height: 44)
                }

                Spacer()
                
                Button {
                    print("Нажата кнорка добавить")
                    withAnimation {
                        isAdded.toggle()  //= true
                    }
                    // ТУТ ДОЛЖНА ПОМЕНЯТЬСЯ КНОПКА, НА ЗЕЛЕНУЮ
                    
                } label: {
                    HStack(spacing: 8) {
                        Text(isAdded ? "Added to list" : "Add to list")
                            .foregroundColor( isAdded ? Color.white : Color.black)
                        if isAdded {
                            AppAssets.done.swiftUIImage
                        } else {
                            AppAssets.add.swiftUIImage
                        }
                    }
                    .padding(.all, 14)
                } .roundedBackground(bgColor: isAdded ? AppAssets.green.swiftUIColor : AppAssets.lightGray.swiftUIColor)
                    
            }
//            .padding(.top, 12)
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

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(router: Router(), lon: 0, lat: 0)
    }
}
