//
//  WeatherManager.swift
//  Clima
//
//  Created by Lisistrata on 29.11.2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
struct WeatherManager {// формирование запроса appid=02ffe986c703deac52b08a9e0d9dd6b2 это эпл ай ди полученный на OpenWeather.com не забыть писать https а не http
    let WeatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=02ffe986c703deac52b08a9e0d9dd6b2&units=metric"
    
    func fetchWeather(cityName: String ){
        let urlString = "\(WeatherURL)&q=\(cityName)" //формирование полного запроса с названием города &q=London например
        performReqest(urlString: urlString)//вызов функции performReqest инпут ставим urlString
    }
    func performReqest(urlString: String ){
// Четыре шага по созданию networking 
// 1. Создание URL
        if  let url = URL(string: urlString){//инициализация - набираем URL потом скобку выбираем инициализатор URL?(string: String) в инпут вводим urlString
        
// 2. Создание сессии - URL адреса
            let session = URLSession(configuration: .default) //печатаем URLSession потом скобки и инициализатор(configuration: URLSessionConfigyration)в инпут вводим .default с точкой в начале!!!
//3. Создание задачи для сессии
          let tack =  session.dataTask(with: url, completionHandler: handle(data:response:error:))
  // печатаем session ставим . выбираем URLSessionDataTack dataTack(with: URL, completionHandler: (Data? URLsponse, Error?)-> Void) оставляем пока не создадим метод func handle, после в графе with: URL вставляем url из if  let url а в графе completionHandler: (Data? URLsponse, Error?)-> Void) начинаем в инпут писать handle он появляется и вставляем его в инпут
 
            //4. Старт задания
            tack.resume() //набираем tack . resume
    }


  }
    func handle(data: Data?, response: URLResponse?, error: Error?)-> Void{
        if error != nil {//проверка на ошибку
            print(error!)
            return
        }
        if let safeData = data{//проверка данных
            let stringData = String(data: safeData, encoding: .utf8)//конвертация в String печатаем let stringData = String потом скобки и выбираем инициализатор String?(data:Data,encoding: String.Encoding) вставляем в инпут data: safeData в encoding: .utf8
            print(stringData)
        }
    }
}
