class CreateVolunteerProjectsTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :volunteers, :volunteer_id, :integer

    create_table :volunteer_projects do |t|
      t.integer :volunteer_id
      t.integer :project_id
      t.timestamps
    end

    add_index :volunteers, :email, unique: true
  end
end
