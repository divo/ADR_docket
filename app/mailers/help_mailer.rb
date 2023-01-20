class HelpMailer < ApplicationMailer

  def help_email
    @message = params[:message]
    @name = params[:name]
    mail(to: Rails.application.credentials[:help_email],
         subject: "ADR App help request from #{params[:email]}",
         from: params[:email],
         reply_to: params[:email],
        )
  end
end
