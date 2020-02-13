class CharactersController < ApplicationController
  def index
    @users = User.all
    @characters = Character.all
    @groups = Group.all
  end

  def new
    @suckr = ImageSuckr::GoogleSuckr.new
    @character = Character.new
  end

  def create
    user_id = current_user.id
    @character = Character.create(charcater_params.merge(user_id: user_id))
    if @character.valid?
      redirect_to character_path(@character)
    else
      flash[:errors] = @character.errors.full_messgas
    redirect_to new_character_path
    end
  end

  def show
    @character = Character.find(params[:id])
  end 

  def edit
    @character = Character.find(params[:id])
  end

  def update
    @character = Character.find(params[:id])
    @character.update(charcater_params)
    redirect_to character_path(@character)
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    redirect_to "/welcome"
  end

  private
  def charcater_params
    params.require(:character).permit(:name,:group_id)
  end

end
