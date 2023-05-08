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
    var temperature: Int
    let icon: Icon
    var date: Date
    var coordinate: CLLocationCoordinate2D
    
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
    
    init(coordinate: CLLocationCoordinate2D,
         temperature: Int,
         icon: Icon,
         date: Date,
         onTapDelete: @escaping (CLLocationCoordinate2D) -> Void) {
        self.coordinate = coordinate
        self.temperature = temperature
        self.icon = icon
        self.date = date
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
                        .padding(.top, 7).padding(.horizontal, 20)
                    
                    HStack {
                        
                        HStack(alignment: .top, spacing: 0) {
                            Text(String(temperature))
                                .font(.system(size: 60))
                            Text("°")
                                .font(.system(size: 20))
                                .offset(y: 10)
                        }
                        .padding(.leading, 20)
                        
                        Spacer()
                        
                        icon.image
                            .padding(.trailing, 20)
                    }
                    
                    Text(date.toString(style: .amPm))
                        .padding(.bottom, 7)
                        .font(.system(size: 12))
                        .foregroundColor(AppAssets.mediumGray.swiftUIColor)
                        .fontWeight(.semibold)
                    
                }
                
                // удаление при нажатии на корзинку - кнопка
                Button(
                    action: {
                        print("кнопка удаления работает")
                        // удаление из core data!!!
                        onTapDelete(coordinate)
                }, label: {
                    AppAssets.trash.swiftUIImage
                        .padding(.top, 12)
                        .padding(.trailing, 12)
                })
            }
        }
        .onAppear {
            Task {
                if let cityName = await getCityName(coordinates: coordinate) {
                    self.cityName = cityName
                }
            }
        }
        .roundedBackground()
    }
}

struct CityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CityDetailView(coordinate: CLLocationCoordinate2D(latitude: 30, longitude: 30),
                       temperature: 25,
                       icon: .drizzleFreezing,
                       date: Date(), onTapDelete: {_ in})
    }
}
