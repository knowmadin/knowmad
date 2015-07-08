class GoogleIdentity < Identity
  self.table_name = 'google_identities'

  belongs_to :account

  validates_uniqueness_of :email
end
