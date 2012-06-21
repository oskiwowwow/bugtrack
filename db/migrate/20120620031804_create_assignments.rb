class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :person_id
      t.integer :client_id
      t.integer :order
      t.timestamps
    end
    add_index :assignments, :client_id
    add_index :assignments, :person_id
    Assignment.create(person_id: '1', client_id: '1', order: '1')
    Assignment.create(person_id: '4', client_id: '1', order: '2')
    Assignment.create(person_id: '5', client_id: '3', order: '1')
  end
end
