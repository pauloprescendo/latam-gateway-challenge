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
end
