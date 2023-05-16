class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :default
      t.string :system
      t.string :uid
      t.string :default
      t.string :system
      t.string :name
      t.string :email
      t.string :image
      t.string :password_digest
      t.string :role
      t.string :default
      t.string :client

      t.timestamps
    end
  end
end
