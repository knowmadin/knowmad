class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    render 'home/index'
  end

  def twitter
    render 'home/index'
  end

  def google_oauth2
    render 'home/index'
  end
end
