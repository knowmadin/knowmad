class GoogleIdentity < ActiveRecord::Base
  devise :rememberable, :trackable
end
