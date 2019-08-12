require 'jwt'

module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
    cookies.permanent[:token] = create_token user.id
  end

  def log_out
    session.delete(:user_id)
    cookies.delete(:token)
    @current_user = nil
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    elsif cookies[:token]
      token = verify_token(cookies[:token])
      if token && (user = User.find_by(id: token.id))
        log_in user
        @current_user = user
      else
        log_out
      end
    end
  end

  def is_logged_in?
    !current_user.nil?
  end

  def create_token(id)
    puts Cookiegram::Application.config.token_rsa_private
    JWT.encode({id: id}, Cookiegram::Application.config.token_rsa_private, 'RS256')
  end

  def verify_token(token)
    JWT.decode token, Cookiegram::Application.config.token_rsa_public, true, { algorithm: 'RS256' }
  end

end
