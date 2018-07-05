class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!

  def index
    @user = current_user
    @calendars = current_user.calendars
    respond_to do |format|
      format.html { render :index}
      format.json { render json: {calendars: @calendars, user: @user}, status: 200}
    end
  end

  def show
    @users = User.all.where.not(id: current_user.id)
    @user = current_user
    @calendars = current_user.calendars
  end

  def new
    @calendar = current_user.calendars.build
    render :new
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
      redirect_to new_calendar_path, alert: 'Your calendar did not save. Please try again.'
    end
  end

  def update
    if @calendar.calendar_admin?(current_user)
      @new_user = User.find(params[:calendar][:user_ids])
      if @calendar.users.include?(@new_user)
        redirect_to user_calendar_path(@calendar), alert: 'This user has already been added to this calendar.'
      else
        @calendar.users << @new_user
        if @calendar.save
          redirect_to user_calendar_path(@calendar), notice: 'Your calendar has been updated.'
        else
          redirect_to user_calendar_path(@calendar), alert: 'Something went wrong, please try again.'
        end
      end
    end
  end

  def destroy
    if @calendar.calendar_admin?(current_user)
      if @calendar.posts.count == 0
        @calendar.destroy
        redirect_to root_path, notice: 'Your calendar has been deleted.'
      else
        redirect_to user_calendar_path(@calendar), alert: "There are other contributors on this calendar that are relying on the scheduled posts. Remove all posts to delete this calendar."
      end
    else
      redirect_to user_calendar_path(@calendar), alert: "You are not authorized to delete this calendar."
    end
  end

  private

  def set_calendar
    @calendar = Calendar.find(params[:id])
  end

  def calendar_params
    params.require(:calendar).permit(:name)
  end
end
