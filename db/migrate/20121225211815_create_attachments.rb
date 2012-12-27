class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string  :description
      t.integer :submission_id
      t.integer :project_id
      t.string  :title
      t.string  :photo_file_name
      t.integer :photo_file_size

      t.timestamps
    end
    add_index :attachments, [:submission_id, :title]
  end
end
