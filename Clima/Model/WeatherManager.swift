//
//  WeatherManager.swift
//  Clima
//
//  Created by Sévio on 21/10/22.
//

import Foundation

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=4f5741f2ec4a9ffa8b171976df9b4527&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
        print(urlString)
    }
    
    func performRequest(urlString: String) {
        // 1. Create a URL
        if let url = URL(string: urlString) {
            // 2. Create a URL Session
            let session = URLSession(configuration: .default)
            // 3. Give the session a task
            let task = session.dataTask(with: url, completionHandler: handle(data: response: error: ))
            // 4. Start the Task
            task.resume()
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
    
}
