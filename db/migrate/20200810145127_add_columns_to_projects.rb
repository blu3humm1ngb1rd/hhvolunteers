class AddColumnsToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :created_at, :datetime
    add_column :projects, :updated_at, :datetime
    add_column :projects, :volunteer_id, :integer
  end
end
