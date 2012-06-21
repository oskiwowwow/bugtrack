class CreateCallComments < ActiveRecord::Migration
  def change
    create_table :call_comments do |t|
      t.integer :call_id
      t.integer :author_id
      t.text :body
      t.boolean :internal, :default => false
      t.timestamps
    end
    add_index :call_comments, :call_id
    add_index :call_comments, :author_id
    CallComment.create(call_id: '1', author_id: '2', body: "Reported against production application.", internal: '0')
    CallComment.create(call_id: '1', author_id: '1', body: "This is not a bug, not reproducible.", internal: '1')
  end
end
