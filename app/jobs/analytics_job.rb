class AnalyticsJob < ApplicationJob
  queue_as :default

  def perform(created_at, session_id, user_id, event)
    ::AnalyticsClient.new().send_analytics(
      url: Rails.application.credentials[:analytics_url],
      created_at: created_at,
      session_id: session_id,
      user_id: user_id,
      events: [event]
    )
  end
end
