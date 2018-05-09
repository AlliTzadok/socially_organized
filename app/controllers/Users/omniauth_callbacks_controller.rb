class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    set_and_redirect
  end

  def google_oauth2
    set_and_redirect
  end

  def set_and_redirect
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end

end
