class WeatherDatumSerializer < ActiveModel::Serializer
  attributes :id, :pincode, :current_temperature, :wind_speed, :wind_direction, :status, :city, :state
end