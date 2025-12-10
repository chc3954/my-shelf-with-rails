class RegistrationsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]

  def new
    if User.any?
      redirect_to new_session_path, alert: "Account already exists."
    end
  end

  def create
    if User.any?
      redirect_to new_session_path, alert: "Account already exists."
      return
    end

    user = User.new(params.permit(:email_address, :password, :password_confirmation))
    if user.save
      start_new_session_for user
      redirect_to root_path
    else
      redirect_to new_registration_path, alert: user.errors.full_messages.to_sentence
    end
  end
end
