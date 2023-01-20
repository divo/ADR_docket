class HelpController < ApplicationController
  def new
    @user = User.find_by(id: session[:user_id]) if session[:user_id].present?
  end

  def create
    # Mailer logic
    HelpMailer.with(help_params).help_email.deliver_later

    redirect_to root_path, notice: "Request submitted. We will be in touch shortly."
  end

  protected

  def help_params
    params.permit(:email, :name, :message)
  end
end
