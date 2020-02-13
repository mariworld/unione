class SessionsController < ApplicationController
   skip_before_action :authorized, only: [:new, :create, :login, :welcome]

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect_to '/welcome'
    else
      flash[:danger] = 'Invalid username/password combination'
       redirect_to '/login'
    end
 end

  def login
    if !@user
      flash[:errors] = flash[:errors].each do |error|
        error.full_messages
      end
    end
  end

#   def welcome
   
#   end

  def logout
  end

  def page_requires_login
  end

  def destroy
   session[:user_id] = nil
   redirect_to '/welcome', :notification => "Logged out"
   # log_out
   #  flash.now[:success] = 'Successfully logged out!'
   #  redirect_to root_url
  end
end
