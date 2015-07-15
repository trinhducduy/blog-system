class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.text :body
      t.date :published_date
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :entries, :users
  end
end
