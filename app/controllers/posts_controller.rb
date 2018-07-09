class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_calendars, only: [:finalized, :drafted]
  before_action :set_platforms, only: [:new, :edit]
  before_action :authenticate_user!


  def index
    @user = current_user
    @posts = current_user.all_posts
    respond_to do |format|
      format.html { render :index}
      format.json { render json: {posts: @posts, user: @user}, status: 200}
    end
  end

  def show
    respond_to do |format|
      format.html { render :index}
      format.json {render json: @post}
    end
  end

  def finalized

  end

  def drafted

  end

  def post_today


  end

  def new
    @post = current_user.posts.build
    @platform_post = @post.platform_posts.build
    render :new
  end

  def edit
    @calendars = current_user.calendars
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to post_path(@post), notice: "You have successfully created your post planner."
    else
      redirect_to new_post_path, alert: "Something went wrong when trying to save. Try again."
    end
  end

  def update
    if @post.user_id == current_user.id
      @post.update(post_params)
      if @post.save
        redirect_to post_path(@post), notice: 'Your post has been updated.'
      else
        redirect_to edit_post_path(@post)
      end
    else
      redirect_to post_path(@post), alert: 'You are not authorized to edit this post.'
    end
  end

  def destroy
    if @post.user_id == current_user.id
      @post.destroy
      redirect_to posts_path, notice: 'Your post has been deleted.'
    else
      redirect_to posts_path, alert: 'You are not authorized to delete this post. Please consult the post admin.'
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def set_calendars
    @calendars = current_user.calendars
  end

  def set_platforms
    @platforms = Platform.all
  end

  def post_params
    params.require(:post).permit(:title, :content, :link, :finalized, :picture, :user_id, :platform_ids => [], :platform_posts_attributes => [:name])
  end

  def calendar_post_params
    params.require(:calendar_post).permit(:post_id, :calendar_id, :date, :time)
  end
end
