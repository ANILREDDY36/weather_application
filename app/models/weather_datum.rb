class WeatherDatum < ApplicationRecord
    validates :pincode, presence: true, uniqueness: true
    validates :current_temperature, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :status, presence: true
    validates :wind_direction, presence: true
    validates :wind_speed, presence:true
end
