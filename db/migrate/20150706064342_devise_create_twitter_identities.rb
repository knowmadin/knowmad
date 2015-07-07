class DeviseCreateTwitterIdentities < ActiveRecord::Migration
  using(:master, :slave)

  def change
    create_table(:twitter_identities) do |t|
      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip

      t.string :screen_name
      t.string :name
      t.string :profile_image_url
      t.boolean :verified
      t.string :token
      t.string :secret
      t.decimal :twitter_id

      t.timestamps null: false
    end

    add_index :twitter_identities, :screen_name, unique: true
  end
end
