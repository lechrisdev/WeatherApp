//
//  SearchScreenView.swift
//  WeatherApp
//
//  Created by Le Chris on 28.03.2023.
//

import SwiftUI

struct SearchScreenView: View {
    
    @State var searchText: String = ""
    
    var body: some View {
        ScrollView {
            TextFieldView(text: $searchText)
                .padding(.horizontal, 24)
            ScrollView(.horizontal, showsIndicators: false) {
                CityCompletionView(cities: ["London", "Paris", "Odesa", "Bangladesh", "Kirovograd"])
            }
            .padding(.horizontal, 24)
            .padding(.top, 15)

            Text(searchText)
            
        }
        .padding(.top, 12)
    }
}

struct SearchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreenView()
    }
}
