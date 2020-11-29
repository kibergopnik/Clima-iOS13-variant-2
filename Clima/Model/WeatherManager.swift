//
//  WeatherManager.swift
//  Clima
//
//  Created by Lisistrata on 29.11.2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
struct WeatherManager {
    let WeatherURL = "http://api.openweathermap.org/data/2.5/weather?appid=02ffe986c703deac52b08a9e0d9dd6b2&units=metric"
    func fetchWeather(cityName: String ){
        let urlString = "\(WeatherURL)&q=\(cityName)"
        print(urlString)
    }
}
