class Projects < ActiveRecord::Migration[5.2]
  def change
    create_table 'projects' do |t|
      t.string :name
      t.integer :project_id
      t.boolean :completed, default: false
      t.boolean :assigned, default: false
      t.timestamp
    end
  end
end
