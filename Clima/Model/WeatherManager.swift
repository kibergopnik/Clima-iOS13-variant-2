//
//  WeatherManager.swift
//  Clima
//
//  Created by Lisistrata on 29.11.2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
struct WeatherManager {// формирование запроса appid=02ffe986c703deac52b08a9e0d9dd6b2 это эпл ай ди полученный на OpenWeather.com
    let WeatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=02ffe986c703deac52b08a9e0d9dd6b2&units=metric"
    func fetchWeather(cityName: String ){
        let urlString = "\(WeatherURL)&q=\(cityName)" //формирование полного запроса с названием города &q=London например
        performReqest(urlString: urlString)
    }
    func performReqest(urlString: String ){
// Четыре шага по созданию networking
// 1. Создание URL
        if  let url = URL(string: urlString){
// 2. Создание сессии - URL адреса
            let session = URLSession(configuration: .default)
//3. Создание задачи для сессии
          let tack =  session.dataTask(with: url, completionHandler: handle(data:response:error:))
 //4. Старт задания
            tack.resume()
    }


  }
    func handle(data: Data?, response: URLResponse?, error: Error?)-> Void{
        if error != nil {
            print(error!)
            return
        }
        if let safeData = data{
            let stringData = String(data: safeData, encoding: .utf8)
            print(stringData)
        }
    }
}
