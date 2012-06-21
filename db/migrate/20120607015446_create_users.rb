class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_hash
      t.integer :person_id
      t.timestamps
    end
    add_index :users, :person_id
    User.create(username: "mbenson", password_hash: BCrypt::Password.create("password"), person_id: '1')
    User.create(username: "bwood", password_hash: BCrypt::Password.create("password"), person_id: '2')
  end
end
