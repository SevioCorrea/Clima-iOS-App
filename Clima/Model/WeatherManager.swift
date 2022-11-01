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
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    // Dentro de um Closure, quando chamamos um método, usamos o self. (Método = func de uma classe.)
                    self.parseJSON(weatherData: safeData)
                    //let dataString = String(data: safeData, encoding: .utf8)
                    //print(dataString)
                }
            }
            // 4. Start the Task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        
        do {
            let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodeData.main.temp)
            print(decodeData.weather[0].description)
        } catch {
            print(error)
        }
        
    }
    
}
