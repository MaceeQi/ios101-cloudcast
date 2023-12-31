//
//  ForecastViewController.swift
//  CloudCast
//
//  Created by Macee Qi on 9/26/23.
//

import UIKit

class ForecastViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var forecastImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    // Tracks all possible forecasts
    private var forecasts = [WeatherForecast]()
    // Tracks which forecast is being shown, defaults to 0
    private var selectedForecastIndex = 0
    
    
    // Fired when the view has finished loading for the first time
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let fakeData = WeatherForecast(temperature: 25.0,
//                                       date: Date(),
//                                       weatherCode: .partlyCloudy)
//        configure(with: fakeData)
        
        forecasts = createMockData()
        configure(with: forecasts[selectedForecastIndex])
    }
    
    
    // Function gets called when user taps on back button
    @IBAction func didTapBackButton(_ sender: UIButton) {
        // Don't go lower than 0 index
        selectedForecastIndex = max(0, selectedForecastIndex - 1)
        
        // Change the forecast shown in the UI
        configure(with: forecasts[selectedForecastIndex])
    }
    
    // Function gets called when user taps on forward button
    @IBAction func didTapForwardButton(_ sender: UIButton) {
        // Don't go higher than the number of forecasts
        selectedForecastIndex = min(forecasts.count - 1, selectedForecastIndex + 1)
        
        // Change the forecast shown in the UI
        configure(with: forecasts[selectedForecastIndex])
    }
    

    // Returns an array of fake WeatherForecast data models to show
    private func createMockData() -> [WeatherForecast] {
        // Use Calendar API to get a few random dates
        let today = Date()
        var dateComponents = DateComponents()
        dateComponents.day = 1
        let tomorrow = Calendar.current.date(byAdding: dateComponents, to: today)!
        let dayAfterTomorrow = Calendar.current.date(byAdding: dateComponents, to: tomorrow)!
        
        // Create a few mock data to show
        let mockData1 = WeatherForecast(temperature: 59.5, date: today, weatherCode: .violentRainShowers, windSpeed: 3.3, precipitation: 33.3)
        let mockData2 = WeatherForecast(temperature: 65.5, date: tomorrow, weatherCode: .fog, windSpeed: 3.7, precipitation: 13.3)
        let mockData3 = WeatherForecast(temperature: 49.5, date: dayAfterTomorrow, weatherCode: .partlyCloudy, windSpeed: 2.8, precipitation: 23.3)
        
        return [mockData1, mockData2, mockData3]
    }

    private func configure(with forecast: WeatherForecast) {
        forecastImageView.image = forecast.weatherCode.image
        descriptionLabel.text = forecast.weatherCode.description
        temperatureLabel.text = "\(forecast.temperature)°F"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        dateLabel.text = dateFormatter.string(from: forecast.date)
    }
}
