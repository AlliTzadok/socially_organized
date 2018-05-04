class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!

  def index
    @user = current_user
    @calendars = current_user.calendars
  end

  def show
    @users = User.all.where.not(id: current_user.id)
    @user = current_user
    @calendars = current_user.calendars
  end

  def new
    @calendar = current_user.calendars.build
  end

  def edit
  end

  def create
    @calendar = Calendar.new(calendar_params)
    @calendar.admin = current_user
    if @calendar.save
      @calendar.users << current_user
      @calendar.save
      redirect_to user_calendars_path(@calendar), notice: 'Calendar was saved.'
    else
      flash[:error] = @calendar.errors.full_messages
      render :new
    end
  end

  def update
    @user = current_user
    if @calendar.calendar_admin?(@user)
      @calendar.users << User.find(params[:calendar][:user_ids])
      if @calendar.save
        redirect_to user_calendar_path(@calendar), notice: 'Your calendar has been updated.'
      else
        redirect_to user_calendar_path(@calendar)
      end
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
