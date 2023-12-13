class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    render template: "welcome/index", notice: "You have been logged out."
  end
end