class ResetMailer < ActionMailer::Base
  default from: "reset.npnp@gmail.com"

  BACKEND_BASE_ADDRESS = "http://npnl.s3-website-us-west-1.amazonaws.com"
  # BACKEND_BASE_ADDRESS = "http://localhost:3006"

  def reset_password(user, token)
    @user = user
    @password_reset_info = {:url => "#{BACKEND_BASE_ADDRESS}/reset_password/update_password/#{token}"}
    mail(to: @user.email, subject: 'NPNL SCORE Assessment Portal Password Reset Request')
  end
end
