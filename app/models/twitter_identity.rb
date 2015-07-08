class TwitterIdentity < ActiveRecord::Base
  include DeviseIdentity

  belongs_to :account

  validates_uniqueness_of :screen_name
end
