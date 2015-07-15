class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.references :user, index: true
      t.references :entry, index: true
      t.integer :parent_id

      t.timestamps null: false
    end
    add_foreign_key :comments, :users
    add_foreign_key :comments, :entries
  end
end
