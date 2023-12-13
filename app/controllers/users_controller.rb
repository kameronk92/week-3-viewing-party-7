class UsersController <ApplicationController 
  def new 
    @user = User.new
  end 

  def show 
    @user = User.find(params[:id])
  end 

  def create 
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "User was successfully created."
      redirect_to user_path(user)
    else  
      flash[:error] = user.errors.full_messages.to_sentence
      redirect_to register_path
    end 
  end 

  def login
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Hi, #{user.name}!"
      if user.admin?
        redirect_to admin_dashboard_path
      elsif user.manager?
        redirect_to root_path
      elsif
        redirect_to root_path
      end
    else
      flash[:error] = "Sorry, your credentials are bad, and you should feel bad."
      render :login_form
    end
  end

  def logout
    @users = User.all
    session[:user_id] = nil
    redirect_to root_path, notice: "You have been logged out."
  end

  private 

  def user_params 
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end 
end 