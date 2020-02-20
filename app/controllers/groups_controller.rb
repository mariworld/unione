class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
    #@post = @group.post
  end

  def create
    user_id = current_user.id
    @group = Group.create(group_params.merge(owner_id: user_id))
    @groups = Group.all
    redirect_to groups_path
  end

  def show
    @group = Group.find(params[:id])
    
  end

  def edit
    @group = Group.find(params[:id])
    @group.avatar.attach(params[:avatar])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(params.require(:group).permit(:username,:avatar,:owner_id,:name,:description))
    redirect_to group_path(@group)
  end

  # def main_menu
  #   @group = Group.find(params[:id])
  #   redirect_to main_menu
  # end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end

  private
  def group_params
    params.require(:group).permit(:name,:description,:post_id)
  end
end
