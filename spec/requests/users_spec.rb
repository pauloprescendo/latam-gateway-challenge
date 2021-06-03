require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'Success POST #signin' do
    it 'returns http success' do
      user = create(:user)
      post '/signin', params: { email: user.email, password: user.password }
      expect(response).to have_http_status(:ok)
    end

    it 'return access token' do
      user = create(:user)
      post '/signin', params: { email: user.email, password: user.password }
      expect(response.body).to include('access_token')
    end

    it 'return invalid credentials' do
      user = create(:user)
      post '/signin', params: { email: user.email, password: '123456789' }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
