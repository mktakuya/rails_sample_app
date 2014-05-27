class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :micropost_id
      t.integer :user_id
      t.string :content

      t.timestamps
    end
    add_index :comments, [:user_id, :created_at]
  end
end
