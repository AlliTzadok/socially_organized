class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  # around_action :set_time_zone

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

    # private
    # def set_time_zone
    #   Time.use_zone(current_user.timezone) { yield }
    # end

end
