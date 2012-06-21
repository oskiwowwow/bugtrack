class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name, :presence => true
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :city
      t.string :state
      t.integer :zip
      t.timestamps
    end
    Client.create(name: "Astellas Pharma US, Inc.", address1: "1 Astellas Way", city: "Northbrook", state: "IL", zip: '60062')
    Client.create(name: "Model N, Inc.", address1: "1800 Bridge Parkway", city: "Redwood Shores", state: "CA", zip: '94065')
    Client.create(name: "Gilead Sciences, Inc.", city: "Foster City", state: "CA")
  end
end
