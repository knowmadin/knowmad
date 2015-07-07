class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :subdomain

      t.timestamps null: false
    end

    add_index :accounts, :subdomain, unique: true
  end
end
