//
//  ViewExtensions.swift
//  WeatherApp
//
//  Created by Le Chris on 24.03.2023.
//

import Foundation
import SwiftUI

extension View {
    
    func roundedBackground(_ cornerRadius: CGFloat = 11) -> some View {
        return ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 15).foregroundColor(AppAssets.lightGray.swiftUIColor)
                    self
                }
    }
}