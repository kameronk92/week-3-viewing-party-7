class ApplicationController < ActionController::Base
  helper_method :current_user
  
  def current_user
    @_current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    if current_user.nil? 
      redirect_to root_path, alert: "You must be logged in to access this page."
    end
  end

  def current_admin?
    if current_user.admin?
      true
    else
      false
    end
  end
end
