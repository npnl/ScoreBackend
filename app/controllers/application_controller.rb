class ApplicationController < ActionController::Base

  skip_before_action :verify_authenticity_token
  before_action :authenticate_user_from_token

  def authenticate_user_from_token
    auth_token = request.headers['Authorization']
    if auth_token && authenticate_with_auth_token(auth_token) && !@session.nil?
      @current_user = @session.user
      @current_group = @current_user.group
    else
      authentication_error
    end
  end

  def authentication_error
    head :unauthorized
  end

  def authenticate_with_auth_token(auth_token)
    @session = Session.where(access_token: auth_token).first
  end

  def set_subject_and_date
    @subject = Subject.where(name: params[:subject_name], group: @current_group).first_or_create
    @date = params[:assessment_date]
    mark_assessment
    render json: { errors: ['Unable to find or create this given subject']  }, status: :not_found if @subject.nil?
  end

end
