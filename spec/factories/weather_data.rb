# spec/factories/weather_data.rb

FactoryBot.define do
    factory :weather_datum do
        pincode { '12345' }
        current_temperature { 25.5 }
        city { 'Example City' }
        state { 'Example State' }
        status { 'sunny' }
        wind_direction { 'north' }
        wind_speed { 10.0 }
    end
end
  