class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :form_authenticity_token

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login!(user)
    session[:session_token] = user.session_token
  end

  def logged_in?
    return false unless current_user
    true
  end

  def redirect_to_cats_if_logged_in
    if logged_in?
      redirect_to cats_url
    end
  end

  def redirect_to_cats_if_not_logged_in
    if !logged_in?
      flash[:errors] = ["must be logged in to create a cat"]
      redirect_to new_session_url
    end
  end


  def logout!
    session[:session_token] = nil
  end
end
