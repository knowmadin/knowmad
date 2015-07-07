class CreateAccounts < ActiveRecord::Migration
  using(:master, :slave)

  def change
    create_table :accounts do |t|
      t.string :subdomain

      t.timestamps null: false
    end

    add_index :accounts, :subdomain, unique: true
  end
end
