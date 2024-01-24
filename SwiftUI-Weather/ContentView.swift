//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Elizabeth Hong on 25/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack {
                CityTextView(cityName: "Singapore, SG")
                
                CurrentWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 25)
                
                HStack(spacing: 14) {
                    WeatherDayView(dayofWeek: "THU",
                                   imageName: "cloud.drizzle.fill",
                                   temperature: 23)
                    
                    WeatherDayView(dayofWeek: "FRI",
                                   imageName: "cloud.bolt.rain.fill",
                                   temperature: 24)
                    
                    WeatherDayView(dayofWeek: "SAT",
                                   imageName: "cloud.sun.fill",
                                   temperature: 26)
                    
                    WeatherDayView(dayofWeek: "SUN",
                                   imageName: "cloud.sun.bolt.fill",
                                   temperature: 25)
                    
                    WeatherDayView(dayofWeek: "MON",
                                   imageName: "cloud.drizzle.fill",
                                   temperature: 27)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title:"Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                
                Spacer()
                
            }
            
            
        
        }
    }
}

#Preview {
    ContentView()
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .white : Color("lightBlue")]),
                       startPoint:.topLeading,
                       endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct CurrentWeatherView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°C")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}

struct WeatherDayView: View {
    var dayofWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayofWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}


