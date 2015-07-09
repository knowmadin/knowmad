require 'knowmad/subdomain_validator'

class Account < ActiveRecord::Base
  validates :subdomain, presence: true, uniqueness: true, subdomain: true

  has_one :email_identity
  has_one :twitter_identity
  has_one :facebook_identity
  has_one :google_identity
end
