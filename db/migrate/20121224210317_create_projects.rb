class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.integer :user_id
    	t.string  :title
      t.string  :project_type
      t.string  :client
      t.string  :concept
      t.string  :delivery_method
      t.string  :street
      t.string  :suite
      t.string  :city
      t.string  :state
      t.string  :zip
      t.string  :deadline
      t.string  :return_by
      # need attachment column for legal contracts #
      
      t.timestamps
    end
    add_index :projects, [:user_id, :title, :project_type]
  end
end
