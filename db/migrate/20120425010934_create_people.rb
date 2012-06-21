class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :fname, :presence => true
      t.string :lname, :presence => true
      t.string :email
      t.integer :client_id    
      t.timestamps
    end
    add_index :people, :client_id
    Person.create(fname: "Max", lname: "Benson", email: "mbenson@modeln.com", client_id: '2')
    Person.create(fname: "Bruce", lname: "Wood", client_id: '1')
    Person.create(fname: "Stacy", lname: "Varghese", client_id: '1')
    Person.create(fname: "Davis", lname: "Feng", client_id: '2')
    Person.create(fname: "Ryan", lname: "Coughran", client_id: '2')
  end
end
