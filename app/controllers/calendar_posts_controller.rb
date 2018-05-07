class CalendarPostsController < ApplicationController
  before_action :set_calendar_post, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_calendars, only: [:index, :show, :new, :edit]
  before_action :authenticate_user!

  def index
    @calendars = current_user.calendars
    @posts = current_user.all_posts
  end

  def show
    @calendars = current_user.calendars
  end

  def new
    @posts = current_user.all_posts
    @calendars = current_user.calendars
    @post = Post.find(params[:post_id])
    @calendar_post = @post.calendar_posts.build
  end

  def edit
    @calendars = current_user.calendars
    @posts = current_user.all_posts
  end

  def create
    @post = Post.find(params[:post_id])
    binding.pry
    @calendar_post = @post.calendar_posts.build(calendar_post_params)
    if @calendar_post.save
      binding.pry
      redirect_to post_calendar_posts_path, notice: 'Your post has been scheduled.'
    else
      redirect_to edit_post_calendar_post_path(@calendar_post)
    end
  end

  def update
    @calendar_post.update(calendar_post_params)
    if @calendar_post.save
      redirect_to post_calendar_posts_path, notice: 'Your scheduled post has been updated.'
    else
      redirect_to edit_post_calendar_post_path(@calendar_post)
    end
  end

  def destroy
    @calendar_post.destroy
    redirect_to post_calendar_posts_path, notice: 'You have removed your scheduled post'
  end


  private

  def calendar_post_params
    params.require(:calendar_post).permit(:post_id, :calendar_id, :date, :time)
  end

  def set_calendar_post
    @calendar_post = CalendarPost.find(params[:id])
  end

  def set_calendars
    @calendars = current_user.calendars
  end

end
