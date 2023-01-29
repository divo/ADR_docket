class ApplicationController < ActionController::Base
  before_action :authorize

  def authorize
    unless (@user = User.find_by(id: session[:user_id]))
      redirect_to login_url, notice: "Please login"
    end
  end

  def send_analytics(event, user)
    AnalyticsJob.perform_later(Time.now.to_s, session.id.to_s, user.id, event)
  end
end
