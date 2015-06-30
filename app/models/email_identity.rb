class EmailIdentity < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable,
    :omniauthable, omniauth_providers: [:facebook, :twitter, :google_oauth2]

  # enqueue all devise emails
  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
