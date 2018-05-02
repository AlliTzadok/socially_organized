class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:show, :destroy]
  before_action :authenticate_user!

  def index
    @user = current_user
    @calendars = @user.calendars
  end

  def show
    @users = User.all
    @user = current_user
    @calendars = current_user.calendars

  end

  def new
    @calendar = current_user.calendars.build
  end

  def create
    @calendar = Calendar.new(calendar_params)
    @calendar.admin = current_user
    if @calendar.save
      redirect_to @calendar, notice: 'Calendar was saved.'
    else
      flash[:error] = @calendar.errors.full_messages
      render :new
    end
  end

  def destroy
    @calendar.destroy
    redirect_to root_path, notice: 'Your calendar has been deleted.'
  end

  private

  def set_calendar
    @calendar = Calendar.find(params[:id])
  end

  def calendar_params
    params.require(:calendar).permit(:name)
  end
end
