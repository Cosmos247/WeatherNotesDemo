//
//  WeatherData.swift
//  WeatherNotesDemo
//
//  Created by Cosmos on 05.12.2025.
//

import Foundation

// MARK: - Weather API Response
struct WeatherResponse: Codable {
    let main: MainWeather
    let weather: [Weather]
    let name: String
    let dt: Int
}

struct MainWeather: Codable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case humidity
    }
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

// MARK: - App Models
struct NoteWeather {
    let temperature: Double
    let description: String
    let icon: String
    let cityName: String
    
    var temperatureString: String {
        return String(format: "%.1f°C", temperature)
    }
    
    var iconURL: URL? {
        return URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png")
    }
}
