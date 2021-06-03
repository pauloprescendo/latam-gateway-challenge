require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'POST #signin' do
    let(:user) { create(:user) }

    context 'when the payload is valid' do
      before { post signin_path, params: { email: user.email, password: user.password } }

      it 'should return ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'return access token' do
        expect(response.body).to include('access_token')
      end
    end

    context 'when the payload is invalid' do
      before { post signin_path, params: { email: user.email, password: '123456789' } }

      it 'return invalid credentials' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
