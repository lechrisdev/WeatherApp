//
//  SearchScreenView.swift
//  WeatherApp
//
//  Created by Le Chris on 28.03.2023.
//

import SwiftUI

struct SearchScreenView: View {
    
    @ObservedObject var viewModel: SearchScreenViewModel
    
    var router: Router
        
    init(router: Router) {
        viewModel = SearchScreenViewModel()
        self.router = router
    }
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                HStack(spacing: 3.5) {

                    TextFieldView(text: $viewModel.searchText)
                        .autocorrectionDisabled(true)
                    
                    Spacer()
                    
                    Button {
                        print("Нажата кнорка НАЗАД")
                        router.back(animated: false)
                    } label: {
                        AppAssets.arrowBack.swiftUIImage.renderingMode(.template)
                            .foregroundColor(AppAssets.mediumGray.swiftUIColor)
                            .frame(width: 54, height: 44)
                            .roundedBackground(15)
                    }
                }
                .frame(height:  44)

                CityCompletionView(cities: viewModel.cities, router: router)
                    .padding(.top, 15)
                
                Button {
                    viewModel.search()
                } label: {
                    Text("ПОИСК")
                }
            }
            .padding(.top, 12)
            .padding(.horizontal, 24)
        }
    }
}

struct SearchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreenView(router: Router())
    }
}
