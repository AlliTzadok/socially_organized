class CalendarsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_calendar, only: [:show, :destroy]

  def index
    @calendars = Calendar.all
  end

  def show
    @calendar = Calendar.find(params[:id])

  def new
    @calendar = Calendar.new
  end

  def edit
  end

  def create
    @calendar = Calendar.new(calendar_params)
    @calendar.user = current_user
    if @calendar.save
      redirect_to calendar_path(@calendar)
    else
      flash[:error] = @calendar.errors.full_messages
      redirect_to new_calendar_path
    end
  end

  def destroy
    @calendar = Calendar.find(params[:id])
    redirect_to dashboard_path
  end

  private

  def set_calendar
    @calendar = Calendar.find(params[:id])
  end

  def calendar_params
    params.require(:calendar).permit(:name)
  end
end
