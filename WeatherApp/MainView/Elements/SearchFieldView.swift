//
//  SearchFieldView.swift
//  WeatherApp
//
//  Created by Le Chris on 23.03.2023.
//

import SwiftUI

struct SearchFieldView: View {
    
    var onTap: () -> Void
    
    init(onTap: @escaping () -> Void) {
        self.onTap = onTap
    }
    
    var body: some View {
        
        Button(
            action: {
                onTap()
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
    }
}

struct SearchFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SearchFieldView(onTap: {})
    }
}
