//
//  DetailsView.swift
//  WeatherApp
//
//  Created by Le Chris on 21.03.2023.
//

import SwiftUI

struct DetailsView: View {
    
    let time: String
    let uv: Int
    let rain: Int
    let aq: Int
    
    init(time: String, uv: Int, rain: Int, aq: Int) {
        self.time = time
        self.uv = uv
        self.rain = rain
        self.aq = aq
    }
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 11).foregroundColor(AppAssets.lightGray.swiftUIColor)
            HStack {
                VerticalStack(title: AppLocalization.Details.time, value: time)
                Spacer()
                VerticalStack(title: AppLocalization.Details.uv, value: String(uv))
                Spacer()
                VerticalStack(title: "% " + AppLocalization.Details.rain, value: "\(String(rain)) %")
                Spacer()
                VerticalStack(title: AppLocalization.Details.aq, value: String(aq))
            }
            .padding(.horizontal, 20)
        }.frame(height: 60)
    }
}

struct VerticalStack: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack {
            Text(title)
                .foregroundColor(AppAssets.mediumGray.swiftUIColor)
                .font(.system(size: 12))
            Text(value)
                .foregroundColor(AppAssets.darkGray.swiftUIColor)
                .font(.system(size: 15))
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(time: "11.25 AM", uv: 4, rain: 58, aq: 22)
    }
}
