//
//  CityDetailView.swift
//  WeatherApp
//
//  Created by Le Chris on 29.03.2023.
//

import SwiftUI
import MapKit

struct CityDetailView: View {
    
    @State var cityName: String = ""
    var weather: WeatherModel
    
    var onTapDelete: (CLLocationCoordinate2D) -> Void
    
    func getCityName(coordinates: CLLocationCoordinate2D) async -> String? {
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: coordinates.latitude,
                                  longitude: coordinates.longitude)
        do {
            let placemarks = try await geocoder.reverseGeocodeLocation(location)
            if let placemark = placemarks.first {
                if let city = placemark.locality {
                    return city
                } else if let name = placemark.name {
                    return name
                } else {
                    print("City not found")
                    return nil
                }
            }
        } catch {
            print("Error: \(error.localizedDescription)")
            return nil
        }
        
        return nil
    }
    
    init(weather: WeatherModel,
         onTapDelete: @escaping (CLLocationCoordinate2D) -> Void) {
        self.weather = weather
        self.onTapDelete = onTapDelete
    }
    
    var body: some View {
        VStack {
            
            ZStack(alignment: .topTrailing) {
                
                VStack {
                    
                    Text(cityName)
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                        .fontWeight(.semibold)
                        .frame(alignment: .center)
                        .padding(.top, 7)
                        .padding(.horizontal, 20)
                    Spacer()
                    HStack {
                        
                        HStack(alignment: .top, spacing: 0) {
                            Text(String(weather.temperature))
                                .font(.system(size: 60))
                            Text("°")
                                .font(.system(size: 20))
                                .offset(y: 10)
                        }
                        .padding(.leading, 20)
                        
                        Spacer()
                        
                        weather.icon.image
                            .padding(.trailing, 20)
                    }
                    Spacer()
                    Text(Date().toString(style: .amPm))
                        .padding(.bottom, 7)
                        .font(.system(size: 12))
                        .foregroundColor(AppAssets.mediumGray.swiftUIColor)
                        .fontWeight(.semibold)
                }
                .frame(height: 160)
                .roundedBackground()
                
                // удаление при нажатии на корзинку - кнопка
                Button(
                    action: {
                        print("кнопка удаления работает")
                        // удаление из core data!!!
                        onTapDelete(CLLocationCoordinate2D(latitude: weather.latitude,
                                                           longitude: weather.longtitude))
                        }, label: {
                            AppAssets.trash.swiftUIImage
                                .padding(.top, 12)
                                .padding(.trailing, 12)
                })
            }
        }
        .onAppear {
            Task {
                if let cityName = await getCityName(
                    coordinates: CLLocationCoordinate2D(latitude: weather.latitude,
                                                        longitude: weather.longtitude)) {
                    self.cityName = cityName
                }
            }
        }
    }
}

//struct CityDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CityDetailView(weather: <#T##WeatherModel#>,
//                       onTapDelete: <#T##(CLLocationCoordinate2D) -> Void#>,
//                       temperature: 25,
//                       icon: .drizzleFreezing,
//                       date: Date(), onTapDelete: {_ in})
//    }
//}
