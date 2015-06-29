class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    render 'home/index'
  end
end
