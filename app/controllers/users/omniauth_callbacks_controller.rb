class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    if facebook_identity.errors.any?
      flash[:error] = facebook_identity.errors.full_messages.to_sentence
      redirect_to new_email_identity_session_path
    else
      sign_in(:facebook_identity, facebook_identity)
      redirect_to '/'
    end
  end

  def twitter
    render 'home/index'
  end

  def google_oauth2
    render 'home/index'
  end

  private

  def facebook_identity
    @facebook_identity ||= FacebookIdentity.find_or_create_by(email: raw_info[:email]) do |facebook_identity|
      facebook_identity.name = raw_info[:name]
      facebook_identity.first_name = raw_info[:first_name]
      facebook_identity.last_name = raw_info[:last_name]
      facebook_identity.profile_image_url = raw_info[:image]
      facebook_identity.verified = raw_info[:verfified]
      facebook_identity.facebook_id = raw_info[:id]

      facebook_identity.expires_at = credentials[:expires_at]
      facebook_identity.token = credentials[:token]
    end
  end

  def raw_info
    request.env['omniauth.auth'][:extra][:raw_info]
  end

  def credentials
    request.env['omniauth.auth'][:credentials]
  end
end
