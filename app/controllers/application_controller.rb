class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # gotta be a better way of doing this
  def current_identity
    @current_identity ||= if email_identity_signed_in?
      current_email_identity
    elsif twitter_identity_signed_in?
      current_twitter_identity
    elsif facebook_identity_signed_in?
      current_facebook_identity
    elsif google_identity_signed_in?
      current_google_identity
    end
  end
end
