//
//  CitiesListView.swift
//  WeatherApp
//
//  Created by Le Chris on 29.03.2023.
//

import SwiftUI

struct CitiesListView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            
            AppAssets.arrowBack.swiftUIImage
            
            ScrollView {
                CityDetailView(cityName: "Odesa", temperature: 24, date: Date())
                CityDetailView(cityName: "Kharkiv", temperature: 22, date: Date())
                CityDetailView(cityName: "Ivanofrankivs`ka oblast`frffrrsssb dfs", temperature: 21, date: Date())
                
                // КОГДА БУДЕТ ФОР ИЧ - ТАМ ВЫСТАВИМ РАССТОЯНИЕ МЕЖДУ ЯЧЕЙКАМИ
                    
            }.padding(.top, 24)
            
        }
        .padding(.top, 12)
        .padding(.horizontal, 24)
    }
}

struct CitiesListView_Previews: PreviewProvider {
    static var previews: some View {
        CitiesListView()
    }
}
