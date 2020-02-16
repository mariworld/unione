class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  #wrap_parameters :user, include: [:username, :password, :password_confirmation]

  

########################################### pre-auth-user-methods ################################  
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
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
  @user.avatar.attach(params[:avatar])
 end

 def update
  @user = User.find(params[:id])
  #byebug
  #user_params.delete(:password)
  @user.update!(params.require(:user).permit(:username))
  redirect_to user_path(@user)
 end

 def show
    @user = User.find(params[:id])
 end

 def destroy
  @user = User.find(params[:id])
  @user.destroy
  redirect_to "/welcome"
 end

private
  def user_params
    params.require(:user).permit(:username,:password,:avatar)
  end

end
