class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.text :title, :presence => true
      t.integer :area_id
      t.integer :author_id
      t.integer :assignee_id
      t.integer :client_id
      t.integer :contact_id
      t.integer :status_id
      t.integer :priority_id
      t.integer :severity_id
      t.datetime :date_entered
      t.integer :release_found_id
      t.integer :release_resolved_id
      t.text :resolution
      t.text :problem, :presence => true
      t.integer :system_id
      t.timestamps
    end
    add_index :calls, :area_id
    add_index :calls, :author_id
    add_index :calls, :assignee_id
    add_index :calls, :client_id
    add_index :calls, :contact_id
    add_index :calls, :status_id
    add_index :calls, :priority_id
    add_index :calls, :severity_id
    add_index :calls, :release_found_id
    add_index :calls, :release_resolved_id
    add_index :calls, :system_id
    
    Call.create(title: "Application server throws Java OOM exception", area_id: '17', author_id: '2', assignee_id: '1',
      client_id: '1', contact_id: '3', status_id: '2', priority_id: '7', severity_id: '10',
      date_entered: Time.parse("12/04/2012 13:13:03"), release_found_id: '21', release_resolved_id: '20', system_id: '24',
      problem: "Astellas has found a production problem in Medicaid dealing with credit claim processing. It looks like the 
      problem stems from an SDR included in SP8 that was required due to a RUP2012.1 dependency. When searching for two 
      particular payments, or accessing any of their attached claims, the application throws a stack overflow in the user 
      session.", resolution: "TBD")
  end
end