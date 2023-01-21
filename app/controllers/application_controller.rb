class ApplicationController < ActionController::Base
  before_action :authorize

  def authorize
    unless (@user = User.find_by(id: session[:user_id]))
      redirect_to login_url, notice: "Please login"
    end
  end
end
