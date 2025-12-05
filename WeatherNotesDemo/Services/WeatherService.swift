//
//  WeatherService.swift
//  WeatherNotesDemo
//
//  Created by Cosmos on 05.12.2025.
//

import Foundation
import CoreLocation

enum WeatherError: Error, LocalizedError {
    case invalidURL
    case noData
    case decodingError
    case networkError(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Неправильна URL адреса"
        case .noData:
            return "Дані не отримано"
        case .decodingError:
            return "Помилка обробки даних"
        case .networkError(let error):
            return "Помилка мережі: \(error.localizedDescription)"
        }
    }
}

class WeatherService {
    static let shared = WeatherService()
    
    private let apiKey = "e003ef8300e54c848fce4f87e3da9fb8"
    private let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    
    private init() {}
    
    func fetchWeather(city: String = "Kyiv") async throws -> NoteWeather {
        guard var urlComponents = URLComponents(string: baseURL) else {
            throw WeatherError.invalidURL
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "appid", value: apiKey),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "lang", value: "uk")
        ]
        
        guard let url = urlComponents.url else {
            throw WeatherError.invalidURL
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(WeatherResponse.self, from: data)
            
            return NoteWeather(
                temperature: response.main.temp,
                description: response.weather.first?.description ?? "",
                icon: response.weather.first?.icon ?? "",
                cityName: response.name
            )
        } catch let error as DecodingError {
            throw WeatherError.decodingError
        } catch {
            throw WeatherError.networkError(error)
        }
    }
}
