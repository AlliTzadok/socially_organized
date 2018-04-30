class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:show, :destroy]
  before_filter :authenticate_user!

  def index
    @calendars = current_user.calendars
  end

  def show
    @calendar = Calendar.find(params[:id])

  def new
    @calendar = current_user.calendars.build
  end

  def create
    @calendar = current_user.calendars.build(calendar_params)
    if @calendar.save
      redirect_to @calendar, notice: 'Calendar was saved.'
    else
      flash[:error] = @calendar.errors.full_messages
      redirect_to new_calendar_path
    end
  end

  def destroy
    @calendar.destroy
    redirect_to dashboard_path, notice: 'Your calendar has been deleted.'
  end

  private

  def set_calendar
    @calendar = Calendar.find(params[:id])
  end

  def calendar_params
    params.require(:calendar).permit(:name)
  end
end
