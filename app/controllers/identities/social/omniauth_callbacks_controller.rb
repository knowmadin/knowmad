require 'knowmad/identities'

class Identities::Social::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    identity_initialize_or_create_and_redirect(facebook_identity)
  end

  def twitter
    identity_initialize_or_create_and_redirect(twitter_identity)

  end

  def google_oauth2
    identity_initialize_or_create_and_redirect(google_identity)
  end

  private

  def identity_initialize_or_create_and_redirect(identity)
    if identity.new_record? && !identity.save
      flash[:error] = identity.errors.full_messages.to_sentence
      return redirect_to new_email_identity_session_path
    elsif identity.account_id
      redirect_params = {controller: '/home', action: 'index'}
    else
      redirect_params = {controller: '/accounts', action: 'new'}
    end

    sign_in(identity.to_sym, identity)
    redirect_to redirect_params.merge(anchor: nil)
  end

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
