class CreateVolunteers < ActiveRecord::Migration[5.2]
  def change
      create_table :volunteers do |t|
        t.string :firstname
        t.string :lastname
        t.string :pronouns
        t.string :email
        t.boolean :training, default: false
        t.boolean :qtlgbt
        t.boolean :bipoc 
        t.timestamps 
  end
end
