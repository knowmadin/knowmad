class TwitterIdentity < ActiveRecord::Base
  devise :rememberable, :trackable
end
