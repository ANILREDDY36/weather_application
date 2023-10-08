# spec/models/weather_datum_spec.rb

require 'rails_helper'

RSpec.describe WeatherDatum, type: :model do
  it 'is valid with valid attributes' do
    weather_data = WeatherDatum.new(
      pincode: '12345',
      current_temperature: 25.5,
      city: 'Example City',
      state: 'Example State',
      status: 'sunny',
      wind_direction: 'north',
      wind_speed: 10.0
    )
    expect(weather_data).to be_valid
  end

  it 'is not valid without a pincode' do
    weather_data = WeatherDatum.new(pincode: nil)
    expect(weather_data).not_to be_valid
  end

  it 'is not valid without a current_temperature' do
    weather_data = WeatherDatum.new(current_temperature: nil)
    expect(weather_data).not_to be_valid
  end

  it 'is not valid without a city' do
    weather_data = WeatherDatum.new(city: nil)
    expect(weather_data).not_to be_valid
  end

  it 'is not valid without a state' do
    weather_data = WeatherDatum.new(state: nil)
    expect(weather_data).not_to be_valid
  end

  it 'is not valid without a status' do
    weather_data = WeatherDatum.new(status: nil)
    expect(weather_data).not_to be_valid
  end

  it 'is not valid without a wind_direction' do
    weather_data = WeatherDatum.new(wind_direction: nil)
    expect(weather_data).not_to be_valid
  end

  it 'is not valid without a wind_speed' do
    weather_data = WeatherDatum.new(wind_speed: nil)
    expect(weather_data).not_to be_valid
  end

  it 'ensures uniqueness of pincode' do
    existing_data = create(:weather_datum, pincode: '12345')  # Assuming you have FactoryBot set up for creating test data
    new_data = build(:weather_datum, pincode: '12345')

    expect(new_data).not_to be_valid
  end
end
