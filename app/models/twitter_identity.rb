class TwitterIdentity < Identity
  self.table_name = 'twitter_identities'

  belongs_to :account

  validates_uniqueness_of :screen_name
end
