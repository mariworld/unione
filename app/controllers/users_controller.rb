class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:username,        
    :password))
    session[:user_id] = @user.id
    if @user.valid?
        redirect_to '/welcome'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to '/users/new'
    end
    #redirect_to '/welcome'
 end

 def edit
  @user = User.find(params[:id])
 end

 def update
  @user = User.find(params[:id])
  #byebug
  @user.update(params.require(:user).permit(:username))
  redirect_to '/welcome'
 end

 def show
    @user = User.find(params[:id])
 end

 private
#  def user_params
#   params.require(:user).permit(:username)
#  end

end
