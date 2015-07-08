require 'knowmad/identities'

class Identities::Social::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    sign_in_and_redirect(facebook_identity)
  end

  def twitter
    sign_in_and_redirect(twitter_identity)

  end

  def google_oauth2
    sign_in_and_redirect(google_identity)
  end

  private

  def sign_in_and_redirect(identity)
    if identity.new_record? && !identity.save
      flash[:error] = identity.errors.full_messages.to_sentence
      return redirect_to new_email_identity_session_path
    elsif identity.account_id.present?
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
