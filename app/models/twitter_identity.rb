class TwitterIdentity < ActiveRecord::Base
  devise :rememberable, :trackable

  validates_uniqueness_of :screen_name
end
