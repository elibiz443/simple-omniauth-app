class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :provider, default: "system"
      t.string :uid, default: "system"
      t.string :name
      t.string :email
      t.string :image
      t.string :password_digest
      t.string :role, default: "client"

      t.timestamps
    end
  end
end
