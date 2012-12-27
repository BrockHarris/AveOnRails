class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string  :title
      t.string  :description
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
    add_index :submissions, [:project_id, :user_id, :title]
  end
end
