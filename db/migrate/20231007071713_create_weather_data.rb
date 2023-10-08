class CreateWeatherData < ActiveRecord::Migration[7.1]
  def change
    create_table :weather_data do |t|
      t.string :pincode
      t.float :current_temperature
      t.string :city
      t.string :state
      t.string :status
      t.string :wind_speed
      t.string :wind_direction

      t.timestamps
    end
  end
end
