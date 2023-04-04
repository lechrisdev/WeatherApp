//
//  MainView.swift
//  WeatherApp
//
//  Created by Le Chris on 20.03.2023.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    init() {
        viewModel = MainViewModel()
    }
    
    var body: some View {
        VStack {
            HStack {
                
                SearchFieldView(onTapSearch: {
                    print("кнопка поиска нажалась, переход на другой экран")
                }, onTapList: {
                    print("кнопка списка нажалась")
                    
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
                .padding(.top, 30)

        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


