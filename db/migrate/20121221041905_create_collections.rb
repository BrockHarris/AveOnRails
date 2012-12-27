class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string  :title
      t.string  :description
      t.integer :user_id

      t.timestamps
    end
    add_index :collections, [:user_id, :title]
  end
end
