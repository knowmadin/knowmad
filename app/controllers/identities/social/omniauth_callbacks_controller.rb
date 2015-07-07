require 'knowmad/facebook_identities/initializer'

class Identities::Social::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    if facebook_identity.errors.any?
      flash[:error] = facebook_identity.errors.full_messages.to_sentence
      redirect_to new_email_identity_session_path
    else
      sign_in(:facebook_identity, facebook_identity)
      redirect_to controller: '/home', action: 'index', anchor: nil
    end
  end

  def twitter
    if twitter_identity.errors.any?
      flash[:error] = twitter_identity.errors.full_messages.to_sentence
      redirect_to new_email_identity_session_path
    else
      sign_in(:twitter_identity, twitter_identity)
      redirect_to controller: '/home', action: 'index', anchor: nil
    end
  end

  def google_oauth2
    render 'home/index'
  end

  private

  def facebook_identity
    @facebook_identity ||= Knowmad::FacebookIdentities::Initializer.new(request.env['omniauth.auth']).facebook_identity
  end

  def twitter_identity
    @facebook_identity ||= Knowmad::TwitterIdentities::Initializer.new(request.env['omniauth.auth']).facebook_identity
  end
end
