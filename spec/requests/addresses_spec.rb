require 'rails_helper'

RSpec.describe AddressesController, type: :request do
  before do
    @user = create(:user)
    post signin_path, params: { email: @user.email, password: @user.password }
    @auth = JSON.parse(response.body)['access_token']
  end

  describe 'GET /addresses/:zip action #find_address' do
    let(:headers) { { 'Authorization' => "Bearer #{@auth}" } }

    context 'when the payload is valid' do
      it 'using existed zip' do
        get "/addresses/#{Faker::Address.zip}", headers: headers
        expect(response).to have_http_status(:ok)
      end

      it 'using invalid zipcode' do
        get '/addresses/0123456789', headers: headers
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
