class ApplicationController < ActionController::Base

  skip_before_action :verify_authenticity_token
  before_action :authenticate_user_from_token

  def authenticate_user_from_token
    auth_token = request.headers['Authorization']
    if auth_token
      authenticate_with_auth_token(auth_token)
    else
      authentication_error
    end
  end

  def authentication_error
    head :unauthorized
  end

  def authenticate_with_auth_token(auth_token)
    session = Session.where(access_token: auth_token).first
    authentication_error if !session
  end

end
