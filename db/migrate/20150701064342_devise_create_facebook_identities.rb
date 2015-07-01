class DeviseCreateFacebookIdentities < ActiveRecord::Migration
  def change
    create_table(:facebook_identities) do |t|
      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.decimal :uid
      t.string :email
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :profile_image_url
      t.string :location
      t.boolean :verified
      t.string :token
      t.datatime :expires_at
      t.decimal :id

      t.timestamps null: false
    end

    add_index :facebook_identities, :email, unique: true
  end
end
