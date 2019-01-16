class ResetPasswordController < ApplicationController
  before_action :check_token_authenticity, only: [:update_password]
  skip_before_action :authenticate_user_from_token

  def request_token
    @user = User.find_by_email(password_update_request_params[:email])
    if @user.nil?
      render json: {errors: ['No account associated with the provided email id'] }, status: :unprocessable_entity
    else
      token = SecureRandom.urlsafe_base64
      ResetPassword.create(reset_token: token, user_id: @user.id)
      ResetMailer.reset_password(@user, token).deliver
      render json: {message: "Password link successfully sent to #{@user.email} via email"}, status: :ok
    end
  end

  def update_password
    @user = User.where(id: @reset_request.user_id, email: password_update_request_params[:email]).first
    if @user.nil?
      render json: {errors: ['The email id and the password reset link does not match. Make sure you are using the email id where you received the reset link.'] }, status: :unprocessable_entity
    else
      @user.update(password: password_params[:password])
      @reset_request.destroy
      if @user.valid?
        render json: {message: 'Password changed successfully' }, status: :ok
      else
        render json: {errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def password_update_request_params
    params.require(:user).permit(:email)
  end

  def check_token_authenticity
    @reset_request = ResetPassword.find_by_reset_token(params[:verification_token])
    if @reset_request.nil?
      render json: {errors: ['The link expired. Please request a new password request link or contact Admin.'] }, status: :unprocessable_entity
    end
  end
end
