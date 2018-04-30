class CalendarsController < ApplicationController

  before_action :set_calendar, only: [:show, :edit, :update, :destroy]

  def index
    @calendars = Calendar.all
  end

  def new
    @calendar = Calendar.new
  end

  def edit
  end

  def create
    @calendar = Calendar.new(calendar_params)
    if @calendar.save
      redirect_to calendar_path(@calendar)
    else
      redirect_to new_calendar_path
    end
  end

  def update
    if @calendar.update(calendar_params)
      redirect_to calendar_path(@calendar)
    else
      redirect_to edit_calendar_path(@calendar)
    end
  end

  def destroy
    @calendar.destroy
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
