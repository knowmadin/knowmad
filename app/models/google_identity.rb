class GoogleIdentity < ActiveRecord::Base
  include DeviseIdentity

  belongs_to :account

  validates_uniqueness_of :email
end
