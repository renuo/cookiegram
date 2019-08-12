class SessionsController < ApplicationController
  protect_from_forgery with: :exception
  include SessionsHelper

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email, username or password'
      render 'new'
    end
  end

  def destroy
  end
end
