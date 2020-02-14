class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    user_id = current_user.id
    @post = Post.create(post_params.merge(user_id: user_id))
    if @post.valid?
      redirect_to post_path(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
  end

  def destroy
   @post = Post.find(params[:id])
   @post.destroy
  redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:message,:group_id,:avatar)
  end
end
