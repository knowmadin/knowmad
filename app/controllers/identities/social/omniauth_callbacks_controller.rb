require 'knowmad/identities'

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
    if google_identity.errors.any?
      flash[:error] = google_identity.errors.full_messages.to_sentence
      redirect_to new_email_identity_session_path
    else
      sign_in(:google_identity, google_identity)
      redirect_to controller: '/home', action: 'index', anchor: nil
    end
  end

  private

  def facebook_identity
    @facebook_identity ||=
      Knowmad::Identities::Facebook::Initializer.new(request.env['omniauth.auth']).facebook_identity
  end

  def twitter_identity
    @twitter_identity ||= Knowmad::Identities::Twitter::Initializer.new(request.env['omniauth.auth']).twitter_identity
  end

  def google_identity
    @google_identity ||= Knowmad::Identities::Google::Initializer.new(request.env['omniauth.auth']).google_identity
  end
end
