class UsersController < ApplicationController
  def signin
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { access_token: token }
    else
      render json: { message: I18n.t('api.invalid_credentials') }, status: :unauthorized
    end
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
