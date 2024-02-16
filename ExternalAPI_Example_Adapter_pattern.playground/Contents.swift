// External Weather API with a different interface
class ExternalWeatherAPI {
    func requestWeatherData(city: String) -> [String: Any] {
        // Simulated response format from the external API
        return [
            "location": city,
            "temp": 25,
            "condition": "Sunny"
        ]
    }
}

// Expected interface for your application
class WeatherAppInterface {
    func displayWeather(data: [String: Any]) {
        // Display logic for your application
        if let location = data["location"] as? String,
           let temp = data["temperature"] as? Int,
           let condition = data["conditions"] as? String {
            print("Current weather in \(location): \(temp)°C, \(condition)")
        }
    }
}

// Adapter to bridge the gap between the external API and your application
class WeatherDataAdapter: WeatherAppInterface {
    let api: ExternalWeatherAPI

    init(api: ExternalWeatherAPI) {
        self.api = api
        super.init()
    }

    func requestAndDisplayWeather(city: String) {
        // Use the external API, adapt the response, and display the weather
        let apiResponse = api.requestWeatherData(city: city)
        let adaptedData = adaptApiResponse(apiResponse: apiResponse)
        displayWeather(data: adaptedData)
    }

    func adaptApiResponse(apiResponse: [String: Any]) -> [String: Any] {
        // Adapt the response format to match the expected interface
        return [
            "location": apiResponse["location"] as? String ?? "",
            "temperature": apiResponse["temp"] as? Int ?? 0,
            "conditions": apiResponse["condition"] as? String ?? ""
        ]
    }
}

// Usage in your application
let externalAPI = ExternalWeatherAPI()
let weatherApp = WeatherDataAdapter(api: externalAPI)

// Request and display weather in your application's expected format
weatherApp.requestAndDisplayWeather(city: "New York")
