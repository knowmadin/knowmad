class FacebookIdentity < ActiveRecord::Base
  devise :rememberable, :trackable
end
