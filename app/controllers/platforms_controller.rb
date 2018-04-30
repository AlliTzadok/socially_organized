class PlatformsController < ApplicationController
  before_action :set_platform, only: [:show]

  def index
    @platforms = Platform.all
  end

  def show
  end

  def new
    @platform = Platform.new
  end

  def create
    @platform = Platform.new(platform_params)
    if @platform.save
      redirect_to dashboard_path
    else
      redirect_to new_platform_path
    end
  end

  private

  def set_platform
    @platform = Platform.find(params[:id])
  end

  def platform_params
    params.require(:platform).permit(:name)
  end 
end
