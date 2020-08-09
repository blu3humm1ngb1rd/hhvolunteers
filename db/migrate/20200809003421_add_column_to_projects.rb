class AddColumnToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :date, :string
    add_column :projects, :time, :string
  end
end
