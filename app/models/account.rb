class Account < ActiveRecord::Base
  validates_uniquness_of :subdomain

  has_one :email_identity
  has_one :twitter_identity
  has_one :facebook_identity
  has_one :google_identity
end
