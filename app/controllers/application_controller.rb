class ApplicationController < ActionController::API
  before_action :authorize, except: [:signin]

  def authorize
    render json: { message: I18n.t('api.unauthorized') }, status: :unauthorized unless logged_in?
  end

  private

  def secret_key_base
    Rails.application.credentials[:secret_key_base]
  end

  def encode_token(payload)
    JWT.encode(payload, secret_key_base)
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ').last
      JWT.decode(token, secret_key_base, true, algorithm: 'HS256')
    end
  rescue JWT::DecodeError
    nil
  end

  def logged_in_user
    return unless decoded_token

    user_id = decoded_token.first['user_id']
    @user = User.find_by(id: user_id)
  end

  def logged_in?
    !!logged_in_user
  end
end
