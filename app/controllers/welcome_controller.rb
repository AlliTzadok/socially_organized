class WelcomeController < ApplicationController

  def home
    if logged_in
      redirect_to dashboard_path(current_use)
    else
      render :index
    end
  end
