# app/services/weather_data_service.rb

require 'json'
require 'dotenv/load'
require 'uri'
require 'net/http'

class WeatherDataService

    def self.fetch_and_create_weather_data(pincode)
      weather_data = fetch_weather_data_from_api(pincode)
      create_or_update_weather_datum(pincode, weather_data)
    end
  
    private
  
    def self.fetch_weather_data_from_api(pincode)
        uri = URI("#{ENV['WEATHER_API_URL']}?key=#{ENV['WEATHER_API_KEY']}&q=#{pincode}")
        response = Net::HTTP.get_response(uri)

        if response.code.to_i == 200
          json_response = JSON.parse(response.body)
          {
            'current_temperature' => json_response['current']['temp_c'],
            'city' => json_response['location']['name'],
            'state' => json_response['location']['region'],
            'status' => json_response['current']['condition']['text'],
            'wind_direction' => json_response['current']['wind_dir'],
            'wind_speed' => json_response['current']['wind_kph']
          }
        else
          raise "Failed to fetch weather data from the API. HTTP Status: #{response.code}"
        end
    end
  
    def self.create_or_update_weather_datum(pincode, weather_data)
      weather_datum = WeatherDatum.find_or_initialize_by(pincode: pincode)
  
      weather_datum.update(
        current_temperature: weather_data['current_temperature'],
        city: weather_data['city'],
        state: weather_data['state'],
        status: weather_data['status'],
        wind_direction: weather_data['wind_direction'],
        wind_speed: weather_data['wind_speed']
      )
      weather_datum.save
  
      weather_datum
    end
  end
  