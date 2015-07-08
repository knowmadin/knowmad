class AddAccountReferenceToIdentities < ActiveRecord::Migration
  using(:master, :slave)

  def change
    add_reference :twitter_identities, :account, index: true
    add_reference :email_identities, :account, index: true
    add_reference :google_identities, :account, index: true
    add_reference :facebook_identities, :account, index: true
  end
end
