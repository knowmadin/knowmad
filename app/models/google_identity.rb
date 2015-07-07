class GoogleIdentity < ActiveRecord::Base
  devise :rememberable, :trackable

  validates_uniqueness_of :email
end
