class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    raise "#{request.env['omniauth.auth']}"
    render 'home/index'
  end

  def twitter
    render 'home/index'
  end

  def google_oauth2
    render 'home/index'
  end
end
