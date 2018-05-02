class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @posts = current_user.posts
    @users = User.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @posts = current_user.posts.select {|p| p.persisted?}
    @post = current_user.posts.build
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      redirect_to new_post_path
    end
  end

  def update
    @post.update(post_params)
    if @post.save
      redirect_to post_path(@post), notice: 'Your post has been updated.'
    else
      redirect_to edit_post_path(@post)
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'Your post has been deleted.'
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :link, :finalized, :picture, :user_id)
  end
end
