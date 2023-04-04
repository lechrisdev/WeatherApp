//
//  TextFieldView.swift
//  WeatherApp
//
//  Created by Le Chris on 28.03.2023.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var text: String
    
    var body: some View {
            HStack {
                TextField("searchScreen",
                          text: $text,
                          prompt: (Text(AppLocalization.Search.searchlocation)
                            .foregroundColor(AppAssets.mediumGray.swiftUIColor)))
                    .font(.system(size: 15))
                    .padding(.leading, 15)
                Spacer()
                AppAssets.search.swiftUIImage
                    .padding(.trailing, 15)
            }
            .frame(height: 44)
            .roundedBackground(15)
            
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(text: .constant(""))
    }
}
