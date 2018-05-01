class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @user = current_user
    @calendars = current_user.calendars
  end

end
