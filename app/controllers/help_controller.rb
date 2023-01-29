class HelpController < ApplicationController
  extend ActiveModel::Naming
  skip_before_action :authorize

  def new
    @user = User.find_by(id: session[:user_id]) if session[:user_id].present?
    @errors = []
  end

  attr_reader :name, :email, :message

  def create
    respond_to do |format|
      if validate! # I give up on trying to pretend this is an ActiveModel object
        HelpMailer.with(help_params).help_email.deliver_later
        send_analytics("ticket_submitted", @user)
        format.html { redirect_to root_path, notice: "Request submitted. We will be in touch shortly." }
      else
        # The problem with this is the "model" (mailer) and the form don't match
        # so I don't get the highlighting of missing information for free.
        format.html { render :new }
      end
    end
  end

  protected

  def help_params
    params.permit(:email, :name, :message)
  end

  def validate!
    @errors = ActiveModel::Errors.new(self)
    @errors.add(:name, :blank, message: "cannot be empty") if params[:name].blank?
    @errors.add(:email, :blank, message: "cannot be empty") if params[:email].blank?
    @errors.add(:message, :blank, message: "cannot be empty") if params[:message].blank?
    @errors.none?
  end

  # The following methods are needed to be minimally implemented

  def read_attribute_for_validation(attr)
    send(attr)
  end

  def self.human_attribute_name(attr, options = {})
    attr
  end

  def self.lookup_ancestors
    [self]
  end
end
