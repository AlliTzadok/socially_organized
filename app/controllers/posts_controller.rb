class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_calendars, only: [:finalized, :drafted]
  before_action :authenticate_user!

  def index
    @posts = current_user.all_posts

    @users = User.all
  end

  def show
    # @calendars = current_user.calendars
    # @calendar_posts = CalendarPost.find_or_initialize_by(post: @post)
    # @calendar_post = @post.calendar_posts.build
  end

  def finalized

  end

  def drafted

  end

  def new
    @post = current_user.posts.build
    @platforms = Platform.all
    @platform_post = @post.platform_posts.build
  end

  def edit
    @calendars = current_user.calendars
    @platforms = Platform.all
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
    binding.pry
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

  def set_calendars
    @calendars = current_user.calendars
  end

  def post_params
    params.require(:post).permit(:title, :content, :link, :finalized, :picture, :user_id, :platform_ids => [], :platform_posts_attributes => [:name])
  end

  def calendar_post_params
    params.require(:calendar_post).permit(:post_id, :calendar_id, :date, :time)
  end
end
