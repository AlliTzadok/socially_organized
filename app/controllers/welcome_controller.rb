class WelcomeController < ApplicationController

  def home
    @calendars = current_user.calendars
  end 
