class SessionsController < ApplicationController
  before_action :set_session, :only => [:destroy]
  skip_before_action :authenticate_user_from_token

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      @session = Session.create(user_id: user.id, access_token: new_session_token)

      render json: { session: @session, user: user }, status: :ok
    else
      render json: { errors: ['Invalid credentials'] }, status: :unauthorized
    end
  end

  def destroy
    @session.destroy

    head :ok
  end

  private

  def set_session
    @session = Session.where(access_token: request.headers['Authorization']).first

    render json: { errors: ['Session not found. Please login again'] }, status: :not_found if @session.nil?
  end

  def new_session_token
    Session.digest(SecureRandom.urlsafe_base64)
  end

end
