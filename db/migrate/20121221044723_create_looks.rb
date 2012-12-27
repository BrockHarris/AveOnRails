class CreateLooks < ActiveRecord::Migration
  def change
    create_table :looks do |t|
      t.string  :description
      t.integer :collection_id
      t.string  :title
      t.string  :photo_file_name
      t.integer :photo_file_size

      t.timestamps
    end
    add_index :looks, [:collection_id, :title]
  end
end
