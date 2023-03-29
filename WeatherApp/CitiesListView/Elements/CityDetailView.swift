//
//  CityDetailView.swift
//  WeatherApp
//
//  Created by Le Chris on 29.03.2023.
//

import SwiftUI

struct CityDetailView: View {
    
    var cityName: String
    var temperature: Int
//    var icon: Image or AppAsset
    var date: Date //String
    
    init(cityName: String, temperature: Int, date: Date) {
        self.cityName = cityName
        self.temperature = temperature
        self.date = date
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
                        
                        AppAssets.cloud.swiftUIImage
                            .padding(.trailing, 20)
                    }
                    
                    Text(date.toString(style: .amPm))
                        .padding(.bottom, 7)
                        .font(.system(size: 12))
                        .foregroundColor(AppAssets.mediumGray.swiftUIColor)
                        .fontWeight(.semibold)
                    
                }
                
                AppAssets.trash.swiftUIImage
                    .padding(.top, 12)
                    .padding(.trailing, 12)
                
            }
            
        }
//        .frame(height: 140)
        .roundedBackground()
    }
}

struct CityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CityDetailView(cityName: "Odesa", temperature: 25, date: Date())
    }
}
