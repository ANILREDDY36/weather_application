module Api
    module V1
        class WeatherDataController < ApplicationController
            before_action :fetch_weather_data

            def weather_report
                return render json: { error: 'Data Inconsistency please check' },status: :bad_request if @wd.nil?
                
                render json: { data: WeatherDatumSerializer.new(@wd) }, status: :ok
            end

            private

            def fetch_weather_data
                return render json: { error: "please provide a pincode" }, status: :bad_request if params[:pincode].nil?

                @wd = WeatherDatum.find_by(pincode: params[:pincode])
                @wd = WeatherDataService.fetch_and_create_weather_data(params[:pincode]) if @wd.nil? || @wd.updated_at< DateTime.now-30.minutes
            end
        end
    end
end