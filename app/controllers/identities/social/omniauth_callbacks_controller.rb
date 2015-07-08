require 'knowmad/identities'

class Identities::Social::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    if facebook_identity.new_record? && !facebook_identity.save
      flash[:error] = facebook_identity.errors.full_messages.to_sentence
      redirect_to new_email_identity_session_path
    elsif facebook_identity.account_id.present?
      sign_in(:facebook_identity, facebook_identity)
      redirect_to controller: '/home', action: 'index', anchor: nil
    else
      sign_in(:facebook_identity, facebook_identity)
      redirect_to controller: '/accounts', action: 'new', anchor: nil
    end
  end

  def twitter
    if twitter_identity.new_record? && !twitter_identity.save
      flash[:error] = twitter_identity.errors.full_messages.to_sentence
      redirect_to new_email_identity_session_path
    elsif twitter_identity.account_id.present?
      sign_in(:twitter_identity, twitter_identity)
      redirect_to controller: '/home', action: 'index', anchor: nil
    else
      sign_in(:twitter_identity, twitter_identity)
      redirect_to controller: '/accounts', action: 'new', anchor: nil
    end
  end

  def google_oauth2
    if google_identity.new_record? && !google_identity.save
      flash[:error] = google_identity.errors.full_messages.to_sentence
      redirect_to new_email_identity_session_path
    elsif google_identity.account_id.present?
      sign_in(:google_identity, google_identity)
      redirect_to controller: '/home', action: 'index', anchor: nil
    else
      sign_in(:google_identity, google_identity)
      redirect_to controller: '/accounts', action: 'new', anchor: nil
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
