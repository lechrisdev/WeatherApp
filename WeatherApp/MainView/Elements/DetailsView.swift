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
            RoundedRectangle(cornerRadius: 11).foregroundColor(Color("LightGray"))
            HStack {
                VerticalStack(title: "TIME", value: time)
                Spacer()
                VerticalStack(title: "UV", value: String(uv))
                Spacer()
                VerticalStack(title: "% RAIN", value: "\(String(rain)) %")
                Spacer()
                VerticalStack(title: "AQ", value: String(aq))
            }
            .padding(.horizontal, 20)
        }.frame(height: 60)
    }
}

struct VerticalStack: View {
    var title: String
    var value:String
    
    var body: some View {
        VStack {
            Text(title)
                .foregroundColor(Color("MediumGray"))
                .font(.system(size: 12))
            Text(value)
                .foregroundColor(Color("DarkGray"))
                .font(.system(size: 15))
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(time: "11.25 AM", uv: 4, rain: 58, aq: 22)
    }
}
