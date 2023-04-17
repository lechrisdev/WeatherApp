//
//  SearchFieldView.swift
//  WeatherApp
//
//  Created by Le Chris on 23.03.2023.
//

import SwiftUI

struct SearchFieldView: View {
    
    var onTapSearch: () -> Void
    var onTapList: () -> Void
    
    init(onTapSearch: @escaping () -> Void,
         onTapList: @escaping () -> Void) {
        self.onTapSearch = onTapSearch
        self.onTapList = onTapList
    }
    
    var body: some View {
        
        HStack(spacing: 15) {
            Button(
                action: {
                    onTapSearch()
            }, label: {
                
                HStack {
                    Text(AppLocalization.Search.searchlocation)
                        .font(.system(size: 15))
                        .padding(.leading, 15)
                        .foregroundColor(AppAssets.mediumGray.swiftUIColor)
                    Spacer()
                    AppAssets.search.swiftUIImage
                        .padding(.trailing, 15)
                }
            })
            .frame(height: 44)
            .roundedBackground(15)
            //          КНОПКА С 3-МЯ ПОЛОСОЧКАМИ
            Button(
                action: {
                    onTapList()
            }, label: {
                
                AppAssets.list.swiftUIImage
            })
            .frame(width: 54, height: 44)
            .roundedBackground(15)
            .frame(width: 54)
        }
        .frame(height: 44)
    }
}

struct SearchFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SearchFieldView(onTapSearch: {}, onTapList: {})
    }
}
