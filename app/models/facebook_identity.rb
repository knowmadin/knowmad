class FacebookIdentity < Identity
  self.table_name = 'facebook_identities'

  belongs_to :account

  validates_uniqueness_of :email
end
