//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Elizabeth Hong on 25/1/24.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .foregroundStyle(textColor)
            .font(.system(size: 20, weight: .bold))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}
