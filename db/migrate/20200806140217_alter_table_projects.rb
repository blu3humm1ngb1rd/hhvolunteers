class AlterTableProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :role, :string
    add_column :projects, :number_of_hours, :string
    remove_column :projects, :project_id, :integer
  end
end
