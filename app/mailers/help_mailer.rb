class HelpMailer < ApplicationMailer
  default from: 'no-reply@example.com'# Use user email if available, although do so from the view

  def help_email
    mail(to: Rails.application.credentials[:help_email], subject: 'This is a test')
  end
end
