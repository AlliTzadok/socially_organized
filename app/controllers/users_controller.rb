class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @user = current_user
    @calendars = current_user.calendars
    @posts = current_user.all_posts
  end

end
