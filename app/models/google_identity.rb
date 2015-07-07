class GoogleIdentity < Identity
  belongs_to :account

  validates_uniqueness_of :email
end
