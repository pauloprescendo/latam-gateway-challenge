class ApplicationController < ActionController::API
  before_action :authorized, except: [:signin]

  def authorized
    render json: { message: I18n.t('api.unauthorized') }, status: :unauthorized unless logged_in?
  end
end
