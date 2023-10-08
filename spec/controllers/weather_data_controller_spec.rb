require 'rails_helper'

RSpec.describe Api::V1::WeatherDataController, type: :controller do
  describe 'GET #weather_report' do
    context 'when pincode is provided' do
      it 'should return ok and respective data' do
        get :weather_data, params: {pincode: 'vijayawada'}
        expect(response).to have_http_status(:ok)
        json_response = JSON.parse(response.body)
        expect(json_response['data'].keys).to contain_exactly('id', 'pincode', 'current_temperature', 'wind_speed', 'wind_direction', 'status', 'city', 'state')
      end
    end
    context 'when pincode is not provided' do
      it 'should return bad request without any pincode ' do
        get :weather_data
        expect(response).to have_http_status(:bad_request)
        json_response = JSON.parse(response.body)
        expect(json_response['error']).to eq('please provide a pincode')
      end
    end
  end
end
