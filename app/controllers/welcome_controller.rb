class WelcomeController < ApplicationController 
  def index 
    @users = User.all
  #   session[:user_id] = 12
  #   session[:purple] = "purple"
  #   unless session[:greeting]
  #     session[:greeting] = "hi Dr Nick"
  #   end
  end 
end 