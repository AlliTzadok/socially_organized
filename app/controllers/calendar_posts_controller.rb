class CalendarPostsController < ApplicationController

  def index
    @calendars = current_user.calendars
    @posts = current_user.posts
  end

  def show
    @calendars = current_user.calendars
  end

  def new
    @posts = current_user.posts
    @calendars = current_user.calendars
    @post = Post.find(params[:post_id])
    @calendar_post = @post.calendar_posts.build
  end

  def edit

  end

  def create



  end

  def update

  end

  def destroy

  end

  private

  def calendar_post_params
    params.require(:calendar_post).permit(:post_id, :calendar_id, :date, :time)
  end

end
