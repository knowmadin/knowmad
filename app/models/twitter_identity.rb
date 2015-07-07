class TwitterIdentity < Identity
  belongs_to :account

  validates_uniqueness_of :screen_name
end
